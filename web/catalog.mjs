/** Resolve presentation inheritance while retaining the provenance of each schema. */
export function presentationEntries(document,logicId,presentationName){
  const lineage=[],seen=new Set();
  function visit(id,name){
    const key=JSON.stringify([id,name]);
    if(seen.has(key))throw new Error('Cyclic presentation inheritance');
    seen.add(key);
    const record=document.logics.find(item=>item.logic_id===id);
    const presentation=record?.presentations.find(item=>item.presentation_name===name);
    if(!presentation)throw new Error(`Unknown presentation ${id}.${name}`);
    if(presentation.extends)visit(presentation.extends.logic_id,presentation.extends.presentation_name);
    lineage.push({logicId:id,presentationName:name,presentation});
  }
  visit(logicId,presentationName);
  return {
    lineage,
    axioms:lineage.flatMap(entry=>entry.presentation.axioms.map(axiom=>({...axiom,origin:entry.logicId}))),
    rules:lineage.flatMap(entry=>entry.presentation.rules.map(rule=>({...rule,origin:entry.logicId}))),
  };
}

/** Layer extension DAGs; translations, equivalences and membership do not set rank. */
export function layoutGraph(logics,relations){
  const ids=new Set(logics.map(item=>item.logic_id));
  const edges=relations.filter(r=>['extension','conservative_extension','family_extension','language_extension'].includes(r.relation_type)&&ids.has(r.parent)&&ids.has(r.child));
  const rank=new Map([...ids].map(id=>[id,0]));
  const incoming=new Map([...ids].map(id=>[id,0]));
  edges.forEach(r=>incoming.set(r.child,incoming.get(r.child)+1));
  const queue=[...ids].filter(id=>incoming.get(id)===0);
  for(let index=0;index<queue.length;index++){
    const id=queue[index];
    for(const r of edges.filter(r=>r.parent===id)){
      rank.set(r.child,Math.max(rank.get(r.child),rank.get(id)+1));
      incoming.set(r.child,incoming.get(r.child)-1);
      if(incoming.get(r.child)===0)queue.push(r.child);
    }
  }
  // Cyclic imported relations still receive distinct positions without an infinite loop.
  const columns=new Map();
  for(const item of logics){const level=rank.get(item.logic_id);if(!columns.has(level))columns.set(level,[]);columns.get(level).push(item);}
  const height=Math.max(1,...[...columns.values()].map(items=>items.length));
  return Object.fromEntries([...columns].flatMap(([level,items])=>items.map((item,row)=>[item.logic_id,[100+level*210,80+(row+(height-items.length)/2)*110]])));
}
