import test from 'node:test';
import assert from 'node:assert/strict';
import {filterLogics} from '../web/filters.mjs';

const records=[
  {logic_id:'K',metadata:{family:'Modal',tags:['Normal modal']}},
  {logic_id:'T',metadata:{family:'Modal',tags:['Normal modal','Reflexive']}},
  {logic_id:'KLFI1',metadata:{family:'Paraconsistent',tags:['LFI','Knowledge']}},
  {logic_id:'Cn',metadata:{family:'Paraconsistent',tags:['LFI'],properties:{record_kind:'Family'}}},
  {logic_id:'Bare',metadata:{family:'Other'}},
];
const families=new Set(records.map(l=>l.metadata.family));
const ids=options=>filterLogics(records,{families,...options}).map(l=>l.logic_id);

test('isolating a family includes only its primary category',()=>{
  assert.deepEqual(ids({families:new Set(['Modal'])}),['K','T']);
  assert.deepEqual(ids({families:new Set()}),[]);
});
test('tags combine with family selection and LFI filtering',()=>{
  assert.deepEqual(ids({tag:'Reflexive',families:new Set(['Modal'])}),['T']);
  assert.deepEqual(ids({tag:'Knowledge',lfiOnly:true}),['KLFI1']);
  assert.deepEqual(ids({tag:'Knowledge',families:new Set(['Modal'])}),[]);
});
test('record-kind filters distinguish systems from family records with optional metadata',()=>{
  assert.deepEqual(ids({recordKind:'family',lfiOnly:true}),['Cn']);
  assert.deepEqual(ids({recordKind:'system'}),['K','T','KLFI1','Bare']);
  assert.deepEqual(ids({}),records.map(l=>l.logic_id));
});
