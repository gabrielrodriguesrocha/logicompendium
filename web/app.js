import {math, mathText, inferenceRule, signature, operatorsToLatex} from './math.mjs';
import {presentationEntries, layoutGraph} from './catalog.mjs';
import {createGraph} from './graph.mjs';
import {filterLogics} from './filters.mjs';

let graphView=null;

const $ = (selector, root = document) => root.querySelector(selector);
const $$ = (selector, root = document) => [...root.querySelectorAll(selector)];
const escape = value => String(value ?? '').replace(/[&<>"']/g, char => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char]));
const normalize = value => String(value).normalize('NFKD').replace(/\p{M}/gu, '').replace(/[₀-₉]/g, digit => '₀₁₂₃₄₅₆₇₈₉'.indexOf(digit)).toLowerCase().replace(/[_’']/g, '');
const short = {SOHenkin:'SO (H)',AMLFI1K:'AM₁(K)',AMLFI1KB4:'AM₁(KB4)',UMLFI1K:'UM₁(K)',UMLFI1KB4:'UM₁(KB4)',DLFamily:'DL',DL_S:'S',FL0:'FL₀',ELBottom:'EL⊥',ELPlusPlusObject:'EL++ obj.',EpistemicK:'Kᵢ',EpistemicT:'Tᵢ',EpistemicS4:'S4ᵢ',EpistemicS5:'S5ᵢ',EpistemicCommon:'EL+C',EpistemicDistributed:'EL+D',EpistemicCD:'EL+C+D',PALCommon:'PAL+C',EALCommon:'EAL+C',TestFreePDL:'PDL₀',Comega:'Cω',Cn:'Cₙ',C1Plus:'C₁⁺',EightKb:'8Kb',CPL:'CPL', IPC:'IPC', K:'K', T:'T', S4:'S4', S5:'S5', FDE:'FDE', K3:'K₃', LP:'LP', mbC:'mbC', J3:'J₃', LFI1:'LFI1'};
const subtitles = {KLFI1:'LFI1 · arbitrary frames',KB4LFI1:'LFI1 · partial equivalence',S5LFI1:'LFI1 · equivalence frames',PALFI1:'Public announcements',AMLFI1:'Action-model updates',UMLFI1:'Factual updates',AMLFI1K:'Action models · K',AMLFI1KB4:'Action models · KB4',UMLFI1K:'Factual updates · K',UMLFI1KB4:'Factual updates · KB4',CPL:'Classical propositional',IPC:'Intuitionistic',K:'Normal modal',T:'Reflexive modal',S4:'Reflexive · transitive',S5:'Equivalence frames',FDE:'First-degree entailment',K3:'Strong Kleene',LP:'Logic of paradox',mbC:'Basic LFI',J3:'D’Ottaviano–da Costa',LFI1:'Formal inconsistency'};
const colors = ['#708398','#b88b4d','#6e88c6','#4b9a91','#9675c3','#b47f89','#7c9a65'];
const familyColors = {'Classical':colors[0],'Intuitionistic':colors[1],'Modal':colors[2],'Many-valued':colors[3],'Paraconsistent':colors[4],'Epistemic':'#4d8dbe','Doxastic':'#a97d45','Dynamic':'#4b9374','Dynamic epistemic':'#b16f88','Description':'#548c94','Quantified':'#866a9b'};
const relationLabels = {extension:'Extension',embedding:'Embedding',equivalence:'Equivalence',sublogic:'Sublogic',conservative_extension:'Conservative expansion',instance:'Family member',family_extension:'Every member extends',reduction:'Reduction translation',language_extension:'Language expansion',parameter_case:'Parameter case'};
const state = {tag:'',recordKind:'',lfiOnly:false,document:null,view:'graph',query:'',families:new Set(),types:new Set(),selected:'J3',compare:new Set(),focus:false,pan:{x:0,y:0,k:1}};
const name = id => /^C[0-9]+$/.test(id) ? 'C'+id.slice(1).replace(/[0-9]/g,digit=>'₀₁₂₃₄₅₆₇₈₉'[Number(digit)]) : short[id] || id;
const logic = id => state.document.logics.find(item => item.logic_id === id);
const familyColor = family => familyColors[family] || colors[[...new Set(state.document.logics.map(item => item.metadata.family))].indexOf(family) % colors.length];
const aliasName = alias => typeof alias === 'string' ? alias : alias.name;
const relationsFor = id => state.document.relations.filter(relation => relation.parent === id || relation.child === id);
const label = type => relationLabels[type] || type;
const tag = (text, family) => `<span class="mini-tag" style="--family-color:${familyColor(family)}">${escape(text)}</span>`;
function notify(message){$('#toast').textContent=message;$('#toast').hidden=false;clearTimeout(notify.timer);notify.timer=setTimeout(()=>$('#toast').hidden=true,3500);}
function safeURL(url){try{const parsed=new URL(url);return ['https:','http:'].includes(parsed.protocol)?parsed.href:'#';}catch{return '#';}}
function sourceLink(id){const source=state.document.sources?.find(item=>item.source_id===id);return source?`<a href="${escape(safeURL(source.url))}" target="_blank" rel="noopener noreferrer">${escape(source.title)} ↗</a>`:`<span>Unknown source: ${escape(id)}</span>`;}
function references(ids=[]){return ids.map(id=>`<div class="source-key">${sourceLink(id)}</div>`).join('');}
function matchingLogics(){
  let list=filterLogics(state.document.logics,state);
  const query=normalize(state.query.trim());
  if(query)list=list.filter(item=>normalize([item.logic_id,item.metadata.name,item.metadata.family,item.metadata.description,...item.metadata.aliases.map(aliasName),...item.metadata.aliases.filter(a=>typeof a!=='string').map(a=>a.author),...(item.metadata.authors||[]),...(item.metadata.tags||[])].join(' ')).includes(query));
  if(state.focus){const ids=new Set([state.selected]);relationsFor(state.selected).filter(r=>state.types.has(r.relation_type)).forEach(r=>{ids.add(r.parent);ids.add(r.child);});list=list.filter(l=>ids.has(l.logic_id));}
  return list;
}
function visibleRelations(logics){const ids=new Set(logics.map(l=>l.logic_id));return state.document.relations.filter(r=>state.types.has(r.relation_type)&&ids.has(r.parent)&&ids.has(r.child));}
function setDocument(document){
  state.document=document;
  state.families=new Set(document.logics.map(item=>item.metadata.family));
  state.types=new Set(document.relations.map(item=>item.relation_type));
  state.compare=new Set([...state.compare].filter(id=>logic(id)));
  if(!logic(state.selected))state.selected=document.logics[0]?.logic_id;
  state.focus=false;state.pan={x:0,y:0,k:1};
  state.mapKey=null;state.lfiOnly=false;state.tag='';state.recordKind='';
}
function renderChrome(){
  const doc=state.document;
  $('#lfi-filter').setAttribute('aria-pressed',String(state.lfiOnly));
  const families=[...new Set(doc.logics.map(item=>item.metadata.family))];
  $('#families').innerHTML=families.map(family=>`<div class="family-row"><button class="family ${state.families.has(family)?'':'off'}" data-family="${escape(family)}" aria-pressed="${state.families.has(family)}" style="--family-color:${familyColor(family)}"><span class="dot"></span>${escape(family)}<span class="count">${doc.logics.filter(item=>item.metadata.family===family).length}</span></button><button class="family-only" data-only-family="${escape(family)}" aria-label="Show only ${escape(family)} logics" title="Show only ${escape(family)} logics">Only</button></div>`).join('');
  const allFamilies=state.families.size===families.length;
  const singleFamily=state.families.size===1?[...state.families][0]:null;
  $('#compact-family').innerHTML=`<option value="" ${allFamilies?'selected':''}>All families</option>${!allFamilies&&!singleFamily?`<option value="custom" selected disabled>${state.families.size} families selected</option>`:''}${families.map(family=>`<option value="${escape(family)}" ${singleFamily===family?'selected':''}>${escape(family)}</option>`).join('')}`;
  const tags=[...new Set(doc.logics.flatMap(item=>item.metadata.tags||[]))].sort((a,b)=>a.localeCompare(b));
  $('#logic-tag').innerHTML=`<option value="">All tags</option>${tags.map(tag=>`<option value="${escape(tag)}" ${state.tag===tag?'selected':''}>${escape(tag)}</option>`).join('')}`;
  $('#record-kind').value=state.recordKind;
  $('.logic-filters').hidden=state.view==='sources';
  $('#stats').innerHTML=[['Logical records',doc.logics.length,`${doc.logics.filter(l=>l.metadata.properties?.record_kind!=='Family').length} systems · ${doc.logics.filter(l=>l.metadata.properties?.record_kind==='Family').length} families`,'◈'],['Relationships',doc.relations.length,'documented','⌘'],['Logic families',families.length,'perspectives','▦'],['Naming aliases',doc.logics.reduce((sum,l)=>sum+l.metadata.aliases.length,0),'indexed','≃']].map(([title,value,unit,icon])=>`<div class="stat"><div class="stat-label">${title}<span class="stat-icon">${icon}</span></div><div class="stat-value">${value}<small>${unit}</small></div></div>`).join('');
  $('#relationship-filters').innerHTML=[...new Set(doc.relations.map(r=>r.relation_type))].map(type=>`<label><input type="checkbox" data-type="${escape(type)}" ${state.types.has(type)?'checked':''}>${escape(label(type))}</label>`).join('')||'<span>No relationships in this document.</span>';
  const hidden=new Set(doc.relations.map(r=>r.relation_type)).size-state.types.size;
  $('#filter-count').textContent=hidden?`(${hidden} hidden)`:'';
  const titles={graph:'Relationship map',catalog:'Logic catalog',sources:'Bibliography'};
  $('#page-name').textContent=titles[state.view];
  $$('[data-view]').forEach(button=>button.classList.toggle('active',button.dataset.view===state.view));
  $('.workspace-toolbar').hidden=state.view==='sources';
  $('.workspace-toolbar').style.display=state.view==='sources'?'none':'';
  if(state.view==='sources')$('#relationship-filters').hidden=true;
  $('#filters-button').setAttribute('aria-expanded',String(!$('#relationship-filters').hidden));
  $('#compare-button').disabled=state.compare.size<2;$('#compare-count').textContent=state.compare.size;
  $('#catalog-status').textContent=`${doc.logics.length} records · curated catalog`;
}
function render(){if(!state.document)return;renderChrome();({graph:renderGraph,catalog:renderCatalog,sources:renderSources})[state.view]();}
function switchView(view){if(view!=='graph'){graphView?.destroy();graphView=null;}state.view=view;render();}
function empty(){return '<div class="empty"><strong>No systems in view.</strong>Try another search or reset the filters.<br><br><button class="button small" data-action="reset-filters">Reset filters</button></div>';}
function renderCatalog(){
  const list=matchingLogics();
  $('#view-content').innerHTML=`<div class="catalog-header"><span>${list.length} of ${state.document.logics.length} records</span><span>Select up to 4 systems to compare</span></div>${list.length?`<div class="cards">${list.map(item=>`<article class="logic-card" style="--family-color:${familyColor(item.metadata.family)}"><div class="card-top"><button class="card-symbol" data-detail="${escape(item.logic_id)}">${escape(name(item.logic_id))}</button>${tag(item.metadata.properties?.record_kind==='Family'?'Family / framework':item.metadata.family,item.metadata.family)}</div><h3>${escape(item.metadata.name)}</h3><p>${mathText(item.metadata.description||'No description provided.')}</p><div class="card-actions"><label><input type="checkbox" data-compare="${escape(item.logic_id)}" ${state.compare.has(item.logic_id)?'checked':''}>Compare</label><button class="text-button" data-detail="${escape(item.logic_id)}">View system →</button></div></article>`).join('')}</div>`:empty()}`;
}
function renderSources(){
  const sources=state.document.sources||[];
  $('#view-content').innerHTML=`<div class="catalog-header"><span>${sources.length} references</span><span>Sources support claims; sketches are not machine-checked proofs.</span></div><div class="source-list">${sources.map((source,i)=>`<article class="source-entry"><div class="source-number">${String(i+1).padStart(2,'0')}</div><div><h3>${escape(source.title)}</h3><p>${escape(source.authors.join(' · '))} <span> / ${source.year}</span></p><a href="${escape(safeURL(source.url))}" target="_blank" rel="noopener noreferrer">Read source ↗</a><div class="source-key">${escape(source.source_id)} · used by ${state.document.logics.filter(l=>(l.metadata.references||[]).includes(source.source_id)).length} systems and ${state.document.relations.filter(r=>(r.references||[]).includes(source.source_id)).length} relationships</div></div></article>`).join('')||empty()}</div>`;
}
const positions={CPL:[465,80],IPC:[245,160],K:[125,330],T:[285,410],S4:[465,430],S5:[650,450],FDE:[495,265],K3:[310,285],LP:[670,220],mbC:[825,365],J3:[840,95],LFI1:[990,240]};
function graphPositions(list){
  if(state.document.logics.every(l=>positions[l.logic_id]))return Object.fromEntries(list.map(l=>[l.logic_id,positions[l.logic_id]]));
  return layoutGraph(list,visibleRelations(list));
}
function fitMap(){graphView?.fit();}
function zoom(factor){graphView?.scaleBy(factor);}
function renderGraph(){
  const list=matchingLogics(),relations=visibleRelations(list),points=graphPositions(list);
  if(!$('.graph')){
    graphView?.destroy();
    $('#view-content').innerHTML=`<div class="map-header"><div><h2>The relationship map</h2><p id="map-counts"></p></div></div><div class="map-wrap"><svg class="graph"></svg><div class="map-context" id="map-context" hidden></div><div class="map-zoom">DRAG TO PAN · SCROLL TO ZOOM · DOUBLE-CLICK TO OPEN</div><div class="map-controls"><button data-zoom="in" aria-label="Zoom in">+</button><button data-zoom="out" aria-label="Zoom out">−</button><button data-zoom="reset" aria-label="Fit map">⤢ Fit</button></div></div><div id="map-empty" hidden>${empty()}</div><div class="map-bottom"><div class="legend"><span><i></i> Extension → stronger system</span><span><i class="embedding"></i> Embedding</span><span><i class="equivalence"></i> Equivalence</span><span><i class="instance"></i> Family member</span><span><i class="conservative_extension"></i> Conservative expansion</span><span><i class="family_extension"></i> Every member extends</span><span><i class="reduction"></i> Reduction translation</span><span><i class="language_extension"></i> Language expansion</span><span><i class="parameter_case"></i> Parameter case</span></div><span>Click a connection for its scope and source ↗</span></div><div id="map-preview"></div>`;
    graphView=createGraph($('.graph'),{
      name,label,familyColor,
      subtitle:item=>subtitles[item.logic_id]||item.metadata.properties?.definition||item.metadata.family,
      onSelect:id=>{state.selected=id;renderGraph();},
      onOpen:openDetail,onRelation:openRelation,
      onTransform:transform=>{state.pan=transform;},transform:state.pan,
    });
  }
  $('#map-counts').textContent=`${list.length} records · ${relations.length} connections in view`;
  $('.map-wrap').hidden=!list.length;$('#map-empty').hidden=!!list.length;
  $('#map-context').hidden=!state.focus;
  $('#map-context').innerHTML=state.focus?`Neighborhood of ${escape(name(state.selected))} <button class="text-button" data-action="unfocus">Show all ↗</button>`:'';
  graphView.update(list,relations.map(relation=>({relation,index:state.document.relations.indexOf(relation)})),points,state.selected,state.compare);
  const selected=logic(state.selected);
  $('#map-preview').innerHTML=selected?`<div class="selection-preview" style="--family-color:${familyColor(selected.metadata.family)}"><div class="preview-symbol">${escape(name(selected.logic_id))}</div><div class="preview-copy"><h3>${escape(selected.metadata.name)} ${tag(selected.metadata.properties?.record_kind==='Family'?'Family / framework':selected.metadata.family,selected.metadata.family)}</h3><p>${mathText(selected.metadata.description||'Explore this system’s formal data and relationships.')}</p></div><button class="text-button" data-action="focus">${state.focus?'Show all':'Focus connections'}</button><button class="button small" data-detail="${escape(selected.logic_id)}">View system ↗</button></div>`:'';
  const mapKey=JSON.stringify([list.map(item=>item.logic_id),[...state.types]]);
  if(mapKey!==state.mapKey){state.mapKey=mapKey;fitMap();}
}
function showDialog(dialog){if(!dialog.open)dialog.showModal();}
function relationCard(relation){return `<article class="relation-card"><header><button class="text-button" data-detail="${escape(relation.parent)}">${escape(name(relation.parent))}</button><span>${relation.relation_type==='equivalence'?'≃':'→'}</span><button class="text-button" data-detail="${escape(relation.child)}">${escape(name(relation.child))}</button><span class="mini-tag">${escape(label(relation.relation_type))}</span></header><p>${mathText(relation.description||'No scope note supplied.')}</p><span class="relation-status">${escape(relation.status||'Unreviewed claim')}</span>${references(relation.references)}</article>`;}
function openRelation(index){
  const relation=state.document.relations[index];if(!relation)return;
  $('#detail-content').innerHTML=`<div class="detail-header"><div><div class="eyebrow">RELATIONSHIP</div><h2 class="relation-detail-heading">${escape(name(relation.parent))} ${relation.relation_type==='equivalence'?'≃':'→'} ${escape(name(relation.child))}</h2><p>${escape(label(relation.relation_type))}</p></div><button class="close" data-close aria-label="Close relationship">×</button></div><div class="detail-body">${relationCard(relation)}<p class="notice">Arrows follow the relation’s stated direction. Equivalence and embedding are distinct from inclusion in a shared language. Literature-backed is an editorial label, not a machine-checked proof.</p></div>`;showDialog($('#detail-dialog'));
}
function openDetail(id){
  const item=logic(id);if(!item)return;state.selected=id;const m=item.metadata;
  const properties=Object.entries(m.properties||{}).map(([key,value])=>`<div class="property"><span>${escape(key.replaceAll('_',' '))}</span><strong>${mathText(value)}</strong></div>`).join('');
  const aliases=m.aliases.map(alias=>`<div class="alias"><span>${escape(aliasName(alias))}</span>${typeof alias==='object'?`<small>${escape(alias.author)} · ${alias.year}</small>`:''}</div>`).join('');
  const semantics=item.semantics.map(semantic=>`<h4>${escape(semantic.semantic_name)} <span class="mini-tag">${escape(semantic.type)}</span></h4>${semantic.domain?`<p>Domain: <strong>${escape(semantic.domain.join(', '))}</strong> · Designated: <strong class="designated">${escape((semantic.designated||[]).join(', '))}</strong></p>`:''}${semantic.operator_mappings.map(mapping=>`<table class="data-table"><thead><tr><th>Input</th><th>${math(operatorsToLatex(mapping.operator))} output</th><th>Designated output</th></tr></thead><tbody>${mapping.mappings.map(pair=>`<tr><td>${math(String(pair.from))}</td><td>${math(Array.isArray(pair.to)?pair.to.join(', '):String(pair.to))}</td><td>${Array.isArray(pair.to)?semantic.type==='ParameterizedMatrices'?'Global parameter choice':'Set of possible outputs':semantic.designated?.includes(pair.to)?'<span class="designated">Yes</span>':'No'}</td></tr>`).join('')}</tbody></table>`).join('')}${semantic.restrictions.map(r=>`<p>${mathText(r.expression)}</p>`).join('')}${semantic.forcing.map(f=>`<div class="formula">${mathText(f.condition)}</div>`).join('')}`).join('');
  const presentations=item.presentations.map(p=>{
    const resolved=presentationEntries(state.document,id,p.presentation_name);
    const renderAxiom=a=>`<h4>${escape(a.id)} <span class="source-key">${escape(a.origin)}</span></h4><div class="formula">${math(a.formula,true)}</div>${a.desc?`<p>${mathText(a.desc)}</p>`:''}`;
    const own=resolved.axioms.filter(a=>a.origin===id),inherited=resolved.axioms.filter(a=>a.origin!==id);
    return `<h4>${escape(p.presentation_name)} · ${escape(p.type)}</h4>${p.extends?`<p>Extends <button class="text-button" data-detail="${escape(p.extends.logic_id)}">${escape(name(p.extends.logic_id))} / ${escape(p.extends.presentation_name)} →</button></p>`:''}${own.map(renderAxiom).join('')}${inherited.length?`<details class="inherited-schemata"><summary>${inherited.length} inherited axiom schemata</summary>${inherited.map(renderAxiom).join('')}</details>`:''}${resolved.rules.map(r=>`<h4>${escape(r.id)} <span class="source-key">${escape(r.origin)}</span></h4>${inferenceRule(r.premises,r.conclusion)}`).join('')}`;
  }).join('');
  const adequacy=item.adequacy.map(a=>`<h4>${escape(a.adequacy_name)}</h4><p>${escape(a.syntax_reference)} ↔ ${escape(a.semantics_reference)}</p>${a.theorems.map(t=>`<div class="relation-card"><header>${escape(t.theorem_id)} <span class="mini-tag">${escape(t.status)}</span></header>${t.formal_statement?`<div class="formula">${math(t.formal_statement,true)}</div>`:''}<p>${mathText(t.desc||'')}${t.proof_method?` Method: ${escape(t.proof_method)}.`:''}${t.finitizable!==null?` Finitizable: ${t.finitizable?'yes':'no'}.`:''}</p></div>`).join('')}`).join('');
  $('#detail-content').innerHTML=`<div class="detail-header" style="--family-color:${familyColor(m.family)}"><div><div class="eyebrow">${escape(m.family.toUpperCase())} / ${m.properties?.record_kind==='Family'?'FAMILY / FRAMEWORK':'LOGICAL SYSTEM'}</div><h2>${escape(name(id))}</h2><p>${escape(m.name)}</p></div><button class="close" data-close aria-label="Close system details">×</button></div><div class="detail-body"><p>${mathText(m.description||'No description supplied.')}</p>${m.authors?`<p>${escape(m.authors.join(' · '))}${m.year?` / ${m.year}`:''}</p>`:''}<div class="detail-tags">${(m.tags||[]).map(t=>tag(t,m.family)).join('')}</div><p class="notice">${m.properties?.record_kind==='Family'?'This record describes a family or framework. Its scope and any parameters are stated below; members are not enumerated or instantiated automatically.':item.presentations.some(p=>p.type.startsWith('Hilbert'))?'Axiom schemata include inherited presentations. Indexed schemata and global-rule restrictions are explicit; mathematical claims remain sourced editorial statements.':'This record encodes a representative fragment. Missing axioms or mappings are unspecified. Stated properties and theorem statuses are source claims; structure and references are checked when the catalog is built.'}</p>${properties?`<section class="detail-section"><h3>Logical properties</h3><div class="property-grid">${properties}</div></section>`:''}${aliases?`<section class="detail-section"><h3>Names & historical aliases</h3>${aliases}</section>`:''}<section class="detail-section"><h3>Signature</h3><div class="signature">${Object.entries(item.signature).map(([operator,arity])=>`<code title="${escape(operator)}">${math(operatorsToLatex(operator))} <small>/ ${arity}</small></code>`).join('')||'<p>No operators supplied.</p>'}</div></section><section class="detail-section"><h3>Semantics</h3>${semantics||'<p>No semantics encoded.</p>'}</section><section class="detail-section"><h3>Presentations</h3>${presentations||'<p>No proof system encoded.</p>'}</section>${adequacy?`<section class="detail-section"><h3>Adequacy claims</h3>${adequacy}</section>`:''}<section class="detail-section"><h3>Relationships · ${relationsFor(id).length}</h3>${relationsFor(id).map(relationCard).join('')||'<p>No connections recorded.</p>'}</section><section class="detail-section"><h3>Sources</h3>${references(m.references)||'<p>No sources provided.</p>'}</section><div class="detail-actions"><button class="button" data-toggle-compare="${escape(id)}">${state.compare.has(id)?'− Remove from':'＋ Add to'} comparison</button><button class="button primary" data-neighborhood="${escape(id)}">Explore connections →</button></div></div>`;
  showDialog($('#detail-dialog'));$('#detail-dialog').scrollTop=0;
}
function toggleCompare(id){
  if(state.compare.has(id))state.compare.delete(id);else if(state.compare.size<4)state.compare.add(id);else{notify('Compare up to 4 systems at a time.');return;}
  renderChrome();if(state.view==='catalog')renderCatalog();else if(state.view==='graph')renderGraph();
}
function openComparison(){
  const list=[...state.compare].map(logic).filter(Boolean);if(list.length<2)return;
  const keys=[...new Set(list.flatMap(l=>Object.keys(l.metadata.properties||{})))];
  const row=(title,values,render=mathText)=>`<tr><td>${escape(title)}</td>${values.map(v=>`<td>${render(v)}</td>`).join('')}</tr>`;
  $('#compare-content').innerHTML=`<div class="detail-header"><div><div class="eyebrow">SIDE BY SIDE</div><h2 class="relation-detail-heading">Compare logical systems</h2><p>Differences depend on the stated language and consequence relation.</p></div><button class="close" data-close aria-label="Close comparison">×</button></div><div class="comparison-wrap"><table class="data-table comparison-table"><thead><tr><th></th>${list.map(l=>`<th>${escape(name(l.logic_id))}</th>`).join('')}</tr></thead><tbody>${row('Name',list.map(l=>l.metadata.name))}${row('Family',list.map(l=>l.metadata.family))}${row('Record kind',list.map(l=>l.metadata.properties?.record_kind||'Logic'))}${row('Aliases',list.map(l=>l.metadata.aliases.map(aliasName).join(', ')||'—'))}${row('Signature',list.map(l=>l.signature),signature)}${row('Domain',list.map(l=>l.semantics.map(s=>s.domain?.join(', ')||'Not finite / unspecified').join('; ')||'Unspecified'))}${row('Designated',list.map(l=>l.semantics.map(s=>s.designated?.join(', ')||'Unspecified').join('; ')||'Unspecified'))}${keys.map(key=>row(key.replaceAll('_',' '),list.map(l=>l.metadata.properties?.[key]||'Unspecified'))).join('')}${row('Presentations',list.map(l=>l.presentations.map(p=>p.presentation_name).join(', ')||'Not encoded'))}</tbody></table><p class="notice">These are cataloged properties, not automatically established results. Family records describe parameter spaces. Inherited schemata and language qualifications are part of each definition.</p></div>`;showDialog($('#compare-dialog'));
}
function download(filename,content,type){const url=URL.createObjectURL(new Blob([content],{type}));const anchor=document.createElement('a');anchor.href=url;anchor.download=filename;anchor.click();setTimeout(()=>URL.revokeObjectURL(url),1000);}
document.addEventListener('click',event=>{
  const button=event.target.closest('button,a');if(!button)return;
  if(button.dataset.view){switchView(button.dataset.view);return;}
  if(button.dataset.detail){openDetail(button.dataset.detail);return;}
  if(button.hasAttribute('data-close')){button.closest('dialog').close();return;}
  if(button.dataset.onlyFamily){state.families=new Set([button.dataset.onlyFamily]);state.focus=false;render();return;}
  if(button.dataset.family){const family=button.dataset.family;if(state.families.has(family))state.families.delete(family);else state.families.add(family);render();return;}
  if(button.dataset.toggleCompare){toggleCompare(button.dataset.toggleCompare);openDetail(button.dataset.toggleCompare);return;}
  if(button.dataset.neighborhood){state.tag='';state.recordKind='';state.lfiOnly=false;state.selected=button.dataset.neighborhood;state.focus=true;state.query='';$('#search').value='';state.families=new Set(state.document.logics.map(l=>l.metadata.family));$$('dialog[open]').forEach(d=>d.close());switchView('graph');return;}
  if(button.dataset.zoom){if(button.dataset.zoom==='reset')fitMap();else zoom(button.dataset.zoom==='in'?1.2:1/1.2);return;}
  const actions={'reset-filters':()=>{state.tag='';state.recordKind='';state.lfiOnly=false;$('#lfi-filter').setAttribute('aria-pressed','false');state.query='';$('#search').value='';state.families=new Set(state.document.logics.map(l=>l.metadata.family));state.types=new Set(state.document.relations.map(r=>r.relation_type));state.focus=false;render();},focus:()=>{state.focus=!state.focus;renderGraph();},unfocus:()=>{state.focus=false;renderGraph();}};
  if(button.dataset.action)actions[button.dataset.action]?.();
});
document.addEventListener('change',event=>{
  if(event.target.dataset.type){const type=event.target.dataset.type;if(event.target.checked)state.types.add(type);else state.types.delete(type);render();}
  if(event.target.dataset.compare){toggleCompare(event.target.dataset.compare);}
});
document.addEventListener('keydown',event=>{
  if(event.target.closest('textarea,input')||$('dialog[open]')||event.ctrlKey||event.metaKey||event.altKey)return;
  if(event.key==='/'){event.preventDefault();if(state.view==='sources')switchView('graph');$('#search').focus();}
  if(['1','2','3'].includes(event.key))switchView(['graph','catalog','sources'][Number(event.key)-1]);
});
$('#search').addEventListener('input',event=>{state.query=event.target.value;if(state.view==='graph')renderGraph();else if(state.view==='catalog')renderCatalog();});
$('#compare-button').addEventListener('click',openComparison);
$('#lfi-filter').addEventListener('click',()=>{state.lfiOnly=!state.lfiOnly;state.focus=false;render();});
$('#filters-button').addEventListener('click',()=>{const filters=$('#relationship-filters');filters.hidden=!filters.hidden;$('#filters-button').setAttribute('aria-expanded',String(!filters.hidden));});
$('#clear-families').addEventListener('click',()=>{state.families=new Set(state.document.logics.map(item=>item.metadata.family));render();});
$('#compact-family').addEventListener('change',event=>{state.focus=false;state.families=event.target.value?new Set([event.target.value]):new Set(state.document.logics.map(item=>item.metadata.family));render();});
$('#logic-tag').addEventListener('change',event=>{state.tag=event.target.value;state.focus=false;render();});
$('#record-kind').addEventListener('change',event=>{state.recordKind=event.target.value;state.focus=false;render();});
$('#example-button').addEventListener('click',()=>{if(!logic('J3')){notify('The J₃ example is not present in this catalog.');return;}state.tag='';state.recordKind='';state.lfiOnly=false;state.selected='J3';state.focus=false;state.query='';$('#search').value='';state.families=new Set(state.document.logics.map(l=>l.metadata.family));switchView('graph');openDetail('J3');});
$('#export-button').addEventListener('click',()=>{if(state.document)download('logicompendium.json',JSON.stringify(state.document,null,2),'application/json');});
$$('dialog').forEach(dialog=>{dialog.addEventListener('click',event=>{if(event.target===dialog){const bounds=dialog.getBoundingClientRect();if(event.clientX<bounds.left||event.clientX>bounds.right||event.clientY<bounds.top||event.clientY>bounds.bottom)dialog.close();}});dialog.addEventListener('close',()=>{if(state.view==='graph')renderGraph();});});
async function init(){
  try{
    const response=await fetch('./catalog.json');
    if(!response.ok)throw new Error('The catalog file could not be loaded.');
    setDocument(await response.json());render();
  }catch(error){$('#view-content').innerHTML=`<div class="error-panel"><strong>Could not load the catalog.</strong><br>${escape(error.message)}<br>Reload this page or try again later.</div>`;$('#catalog-status').textContent='Catalog unavailable';}
}
init();
