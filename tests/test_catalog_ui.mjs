import test from 'node:test';
import assert from 'node:assert/strict';
import {presentationEntries,layoutGraph} from '../web/catalog.mjs';

const base={logic_id:'Base',metadata:{family:'LFI'},presentations:[{presentation_name:'Hilbert',axioms:[{id:'base',formula:'A'}],rules:[{id:'MP'}]}]};
const child={logic_id:'Child',metadata:{family:'LFI'},presentations:[{presentation_name:'Hilbert',extends:{logic_id:'Base',presentation_name:'Hilbert'},axioms:[{id:'ci',formula:'B'}],rules:[]}]};

test('inherited axioms and rules retain provenance',()=>{
  const resolved=presentationEntries({logics:[base,child]},'Child','Hilbert');
  assert.deepEqual(resolved.axioms.map(a=>[a.id,a.origin]),[['base','Base'],['ci','Child']]);
  assert.deepEqual(resolved.rules.map(r=>r.origin),['Base']);
  assert.deepEqual(resolved.lineage.map(p=>p.logicId),['Base','Child']);
});

test('a bad imported chain cannot hang the detail view',()=>{
  const cyclic=structuredClone(child);cyclic.presentations[0].extends.logic_id='Child';
  assert.throws(()=>presentationEntries({logics:[cyclic]},'Child','Hilbert'),/Cyclic/);
  assert.throws(()=>presentationEntries({logics:[child]},'Child','Hilbert'),/Unknown/);
});

test('graph uses extension direction, not embedding or family membership, for ranks',()=>{
  const third={logic_id:'Third',metadata:{family:'LFI'}};
  const layout=layoutGraph([base,child,third],[{relation_type:'extension',parent:'Base',child:'Child'},{relation_type:'embedding',parent:'Child',child:'Base'},{relation_type:'instance',parent:'Child',child:'Third'}]);
  assert.ok(layout.Child[0]>layout.Base[0]);
  assert.equal(layout.Third[0],layout.Base[0]);
  assert.equal(new Set(Object.values(layout).map(p=>p.join(','))).size,3);
});

test('large and cyclic imported maps receive finite, distinct coordinates',()=>{
  const logics=Array.from({length:100},(_,i)=>({logic_id:`L${i}`}));
  const edges=logics.map((l,i)=>({relation_type:'extension',parent:l.logic_id,child:`L${(i+1)%100}`}));
  const layout=layoutGraph(logics,edges);
  assert.equal(new Set(Object.values(layout).map(p=>p.join(','))).size,100);
  assert.ok(Object.values(layout).flat().every(Number.isFinite));
});

test('reverse update reductions do not create extension cycles',()=>{
  const records=['EL','PAL','PALC'].map(logic_id=>({logic_id}));
  const layout=layoutGraph(records,[
    {relation_type:'conservative_extension',parent:'EL',child:'PAL'},
    {relation_type:'conservative_extension',parent:'PAL',child:'PALC'},
    {relation_type:'reduction',parent:'PAL',child:'EL'},
  ]);
  assert.ok(layout.EL[0]<layout.PAL[0]);
  assert.ok(layout.PAL[0]<layout.PALC[0]);
});

test('description language expansions set layers without ranking membership',()=>{
  const records=['DL','ALC','SHOIQ','SROIQ'].map(logic_id=>({logic_id}));
  const layout=layoutGraph(records,[
    {relation_type:'language_extension',parent:'ALC',child:'SHOIQ'},
    {relation_type:'language_extension',parent:'SHOIQ',child:'SROIQ'},
    {relation_type:'instance',parent:'DL',child:'SROIQ'},
    {relation_type:'embedding',parent:'SROIQ',child:'ALC'},
  ]);
  assert.equal(layout.DL[0],layout.ALC[0]);
  assert.ok(layout.ALC[0]<layout.SHOIQ[0]);
  assert.ok(layout.SHOIQ[0]<layout.SROIQ[0]);
});

test('parameter-case relations do not assert family-wide extension ranks',()=>{
  const records=['Cmin','Cn','Cila','C1Plus'].map(logic_id=>({logic_id}));
  const layout=layoutGraph(records,[
    {relation_type:'family_extension',parent:'Cmin',child:'Cn'},
    {relation_type:'parameter_case',parent:'Cn',child:'Cila'},
    {relation_type:'parameter_case',parent:'Cn',child:'C1Plus'},
  ]);
  assert.ok(layout.Cn[0]>layout.Cmin[0]);
  assert.equal(layout.Cila[0],layout.Cmin[0]);
  assert.equal(layout.C1Plus[0],layout.Cmin[0]);
});
