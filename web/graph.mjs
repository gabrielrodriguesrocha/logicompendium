import * as distribution from './vendor/d3/d3.min.js';

// The unmodified UMD distribution exposes a browser global or CommonJS exports.
// This bridge also permits importing the geometry helpers in Node tests.
const d3 = globalThis.d3 ?? distribution.default;
const WIDTH=1120, HEIGHT=530, MIN_SCALE=.001, MAX_SCALE=3;

export function fitTransform(points){
  if(!points.length)return d3.zoomIdentity;
  const minX=d3.min(points,p=>p[0])-100,maxX=d3.max(points,p=>p[0])+100;
  const minY=d3.min(points,p=>p[1])-65,maxY=d3.max(points,p=>p[1])+65;
  const k=Math.max(MIN_SCALE,Math.min(1.6,(WIDTH-100)/(maxX-minX),(HEIGHT-100)/(maxY-minY)));
  return d3.zoomIdentity.translate(WIDTH/2-k*(minX+maxX)/2,HEIGHT/2-k*(minY+maxY)/2).scale(k);
}

export function edgePath(a,b,index){
  const dx=b[0]-a[0],dy=b[1]-a[1],distance=Math.hypot(dx,dy)||1;
  const vertical=Math.abs(dy)>Math.abs(dx)*.65;
  const [sx,sy]=vertical?[a[0],a[1]+Math.sign(dy)*35]:[a[0]+Math.sign(dx)*61,a[1]];
  const [ex,ey]=vertical?[b[0],b[1]-Math.sign(dy)*39]:[b[0]-Math.sign(dx)*65,b[1]];
  const curve=Math.min(65,distance*.18)*(index%2?1:-1);
  const cx=(sx+ex)/2+dy/distance*curve,cy=(sy+ey)/2-dx/distance*curve;
  const path=d3.path();path.moveTo(sx,sy);path.quadraticCurveTo(cx,cy,ex,ey);
  return {d:path.toString(),mx:.25*sx+.5*cx+.25*ex,my:.25*sy+.5*cy+.25*ey};
}

/** Own SVG rendering and interaction; callers supply catalog labels and actions. */
export function createGraph(element,{name,label,familyColor,subtitle,onSelect,onOpen,onRelation,onTransform,transform}){
  const svg=d3.select(element).attr('viewBox',`0 0 ${WIDTH} ${HEIGHT}`)
    .attr('role','group').attr('aria-label','Interactive map of logical systems');
  const marker=svg.append('defs').append('marker').attr('id','logic-atlas-arrow')
    .attr('viewBox','0 0 10 10').attr('refX',8).attr('refY',5)
    .attr('markerWidth',5).attr('markerHeight',5).attr('orient','auto-start-reverse');
  marker.append('path').attr('d','M0,0L10,5L0,10Z').attr('fill','#b3bed0');
  const scene=svg.append('g').attr('id','graph-scene');
  const edgeLayer=scene.append('g').attr('class','graph-edges');
  const nodeLayer=scene.append('g').attr('class','graph-nodes');
  let points=[];
  const behavior=d3.zoom().extent([[0,0],[WIDTH,HEIGHT]]).scaleExtent([MIN_SCALE,MAX_SCALE])
    .clickDistance(4)
    .filter(event=>(!event.ctrlKey||event.type==='wheel')&&!event.button&&
      (event.type==='wheel'||!event.target.closest('[data-node],[data-relation]')))
    .on('start.graph',()=>svg.classed('dragging',true))
    .on('zoom.graph',event=>{
      scene.attr('transform',event.transform);
      onTransform?.({x:event.transform.x,y:event.transform.y,k:event.transform.k});
    })
    .on('end.graph',()=>svg.classed('dragging',false));
  svg.call(behavior).on('dblclick.zoom',null);
  svg.call(behavior.transform,d3.zoomIdentity.translate(transform?.x??0,transform?.y??0).scale(transform?.k??1));

  function update(logics,relations,positions,selected,compare){
    points=logics.map(item=>positions[item.logic_id]);
    const edges=edgeLayer.selectAll('g.graph-edge').data(relations,r=>r.index).join(enter=>{
      const group=enter.append('g').attr('class','graph-edge');
      group.append('path').attr('class','edge');
      group.append('path').attr('class','edge-hit').attr('tabindex',0).attr('role','button').append('title');
      group.append('text').attr('class','edge-label').attr('text-anchor','middle').attr('aria-hidden','true');
      return group;
    });
    edges.each(function(item){
      const r=item.relation,group=d3.select(this),geometry=edgePath(positions[r.parent],positions[r.child],item.index);
      group.select('path.edge').attr('d',geometry.d).attr('class',`edge ${r.relation_type}`)
        .attr('marker-end',r.relation_type==='equivalence'?null:'url(#logic-atlas-arrow)');
      group.select('path.edge-hit').attr('d',geometry.d).attr('data-relation',item.index)
        .attr('aria-label',`${name(r.parent)} to ${name(r.child)}: ${label(r.relation_type)}`)
        .on('click.graph',event=>{event.stopPropagation();onRelation(item.index);})
        .on('keydown.graph',event=>{
          if(['Enter',' '].includes(event.key)){event.preventDefault();event.stopPropagation();onRelation(item.index);}
        })
        .select('title').text(r.description||label(r.relation_type));
      group.select('text.edge-label').attr('x',geometry.mx).attr('y',geometry.my-7)
        .text(r.relation_type==='equivalence'?'≃ equivalent':label(r.relation_type));
    });
    const nodes=nodeLayer.selectAll('g.node').data(logics,item=>item.logic_id).join(enter=>{
      const node=enter.append('g').attr('class','node').attr('role','button').attr('tabindex',0);
      node.append('title');
      node.append('rect').attr('class','node-box').attr('x',-61).attr('y',-35)
        .attr('width',122).attr('height',70).attr('rx',7).attr('fill','white').attr('stroke','#e1e5ed');
      node.append('rect').attr('class','node-accent').attr('x',-61).attr('y',-35)
        .attr('width',3).attr('height',70).attr('rx',1.5).attr('opacity',.6);
      for(const [className,y] of [['node-symbol',-8],['node-subtitle',7],['node-pill',23]]){
        node.append('text').attr('class',className).attr('text-anchor','middle').attr('y',y);
      }
      const badge=node.append('g').attr('class','node-comparison');
      badge.append('circle').attr('cx',52).attr('cy',-27).attr('r',8).attr('fill','#7f8dd1');
      badge.append('text').attr('x',52).attr('y',-24).attr('fill','white')
        .attr('text-anchor','middle').attr('font-size',11).text('✓');
      return node;
    });
    nodes.attr('data-node',item=>item.logic_id)
      .attr('transform',item=>`translate(${positions[item.logic_id]})`)
      .style('--family-color',item=>familyColor(item.metadata.family))
      .classed('selected',item=>selected===item.logic_id)
      .classed('family-record',item=>item.metadata.properties?.record_kind==='Family')
      .attr('aria-label',item=>`${name(item.logic_id)}: ${item.metadata.name}. Enter to view details.`)
      .attr('aria-pressed',item=>String(selected===item.logic_id))
      .on('click.graph',(event,item)=>{event.stopPropagation();onSelect(item.logic_id);})
      .on('dblclick.graph',(event,item)=>{event.preventDefault();event.stopPropagation();onOpen(item.logic_id);})
      .on('keydown.graph',(event,item)=>{
        if(['Enter',' '].includes(event.key)){event.preventDefault();event.stopPropagation();onOpen(item.logic_id);}
      });
    nodes.select('title').text(item=>item.metadata.name);
    nodes.select('.node-accent').attr('fill',item=>familyColor(item.metadata.family));
    nodes.select('.node-symbol').text(item=>name(item.logic_id));
    nodes.select('.node-subtitle').text(item=>subtitle(item).slice(0,20));
    nodes.select('.node-pill').text(item=>item.metadata.properties?.record_kind==='Family'?'Family / framework':item.metadata.tags?.[0]||item.metadata.family);
    nodes.select('.node-comparison').attr('display',item=>compare.has(item.logic_id)?null:'none');
  }

  return {
    update,
    fit(){if(points.length)svg.call(behavior.transform,fitTransform(points));},
    scaleBy(factor){svg.call(behavior.scaleBy,factor);},
    destroy(){svg.on('.zoom',null).classed('dragging',false);svg.selectAll('*').on('.graph',null).remove();},
  };
}
