import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {math,mathText,toLatex,inferenceRule,signature} from '../web/math.mjs';

test('legacy word and Unicode operators become LaTeX',()=>{
  assert.equal(toLatex('A implies (not B and box C)'),String.raw`A \to  (\neg  B \land  \Box  C)`);
  assert.match(toLatex('◦A → (A ∨ ¬B)'),/\\circ.*\\to.*\\lor.*\\neg/);
});

test('native LaTeX and text arguments retain their meaning',()=>{
  const source=String.raw`\frac{A \land B}{A} \quad \text{not and or}`;
  assert.equal(toLatex(source),source);
  assert.equal(toLatex(`$${source}$`),source);
  assert.equal(toLatex(`\\[${source}\\]`),source);
  assert.match(math(source,true),/class="katex-display"/);
  assert.match(math(source),/application\/x-tex/);
});

test('prose supports four math delimiter forms and escapes HTML',()=>{
  const html=mathText(String.raw`<b>Note</b> $A \to B$, \(\neg A\), $$\Box A$$, \[\circ A\].`);
  assert.ok(html.startsWith('&lt;b&gt;Note&lt;/b&gt;'));
  assert.equal((html.match(/class="katex"/g)||[]).length,4);
  assert.equal((html.match(/class="katex-display"/g)||[]).length,2);
  assert.equal(mathText('This is ordinary prose.'),'This is ordinary prose.');
});

test('malformed math falls back to escaped source without breaking the record',()=>{
  const html=math('\\frac{<img src=x onerror=alert(1)>');
  assert.match(html,/class="math-error"/);
  assert.ok(!html.includes('<img'));
  assert.match(html,/&lt;img/);
});

test('untrusted TeX cannot create links or HTML attributes',()=>{
  assert.ok(!math(String.raw`\href{javascript:alert(1)}{A}`).includes('href='));
  assert.ok(!math(String.raw`\htmlClass{attacker}{A}`).includes('class="attacker"'));
});

test('rules render as fractions, including zero-premise rules',()=>{
  assert.match(inferenceRule(['A','A implies B'],'B'),/\\frac\{A\\qquad A \\to  B\}\{B\}/);
  assert.ok(!inferenceRule([],'A').includes('math-error'));
  assert.ok(!signature({not:1,and:2,custom_operator:1}).includes('math-error'));
});

test('all seed axioms render without errors',()=>{
  const source=readFileSync(new URL('../catalog/atlas.dsl',import.meta.url),'utf8');
  for(const match of source.matchAll(/formula = ("(?:[^"\\]|\\.)*")/g)){
    const formula=JSON.parse(match[1]);
    assert.ok(!math(formula,true).includes('math-error'),formula);
  }
});

test('relational semantics and indexed signatures render without errors',()=>{
  const source=readFileSync(new URL('../catalog/atlas.dsl',import.meta.url),'utf8');
  for(const match of source.matchAll(/(?:condition|expression) = ("(?:[^"\\]|\\.)*")/g)){
    const value=JSON.parse(match[1]);
    assert.ok(!mathText(value).includes('math-error'),value);
  }
  const html=signature({knows:1,believes:1,common:1,distributed:1,program_box:1,announce:2,action_box:1,arbitrary_announce:1});
  assert.ok(!html.includes('math-error'));
  assert.equal((html.match(/class="katex"/g)||[]).length,8);
});

test('description constructors, grammar and subsumption rules render as LaTeX',()=>{
  const html=signature({concept_top:0,concept_bottom:0,concept_intersection:2,concept_union:2,concept_complement:1,role_exists:1,role_forall:1,inverse_role:1,nominal:0,min_number:0,max_number:0,min_qualified:1,max_qualified:1,self_restriction:0,universal_role:0});
  assert.ok(!html.includes('math-error'));
  assert.equal((html.match(/class="katex"/g)||[]).length,15);
  const source=readFileSync(new URL('../catalog/atlas.dsl',import.meta.url),'utf8');
  for(const match of source.matchAll(/(?:concept_syntax|interpretation) = ("(?:[^"\\]|\\.)*")/g)){
    const value=JSON.parse(match[1]);
    assert.ok(!mathText(value).includes('math-error'),value);
  }
  const rule=inferenceRule([String.raw`\mathcal T\models C\sqsubseteq D`,String.raw`\mathcal T\models D\sqsubseteq E`],String.raw`\mathcal T\models C\sqsubseteq E`);
  assert.ok(!rule.includes('math-error'));
  assert.match(rule,/\\sqsubseteq/);
});

test('dynamic LFI1 operators, abbreviations and global replacement render',()=>{
  const html=signature({bullet:1,lfi_announce:2,lfi_action:1,lfi_update:1});
  assert.ok(!html.includes('math-error'));
  assert.match(html,/\\bullet/);
  assert.equal((html.match(/class="katex"/g)||[]).length,4);
  const source=readFileSync(new URL('../catalog/atlas.dsl',import.meta.url),'utf8');
  for(const match of source.matchAll(/(?:abbreviations|strong_equivalence|modal_dual|dynamic_operator|truth_values) = ("(?:[^"\\]|\\.)*")/g)){
    const value=JSON.parse(match[1]);
    assert.ok(!mathText(value).includes('math-error'),value);
  }
  assert.ok(!inferenceRule([String.raw`\vdash\theta\equiv\gamma`],String.raw`\vdash\alpha\equiv\alpha[\theta/\gamma]`).includes('math-error'));
});

test('quantified signatures distinguish individual, set and relation binders',()=>{
  const html=signature({equals:2,forall:1,exists:1,forall_set:1,exists_set:1,forall_relation:1,exists_relation:1});
  assert.ok(!html.includes('math-error'));
  assert.equal((html.match(/class="katex"/g)||[]).length,7);
  assert.match(html,/\\forall X/);
  assert.match(html,/\\forall R\^\{n\}/);
  assert.ok(!html.includes('operatorname'));
});
