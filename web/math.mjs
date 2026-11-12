import katex from './vendor/katex/katex.mjs';

const escape = value => String(value ?? '').replace(/[&<>"']/g, char => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char]));
const operators = {
  not:'\\neg', and:'\\land', or:'\\lor', implies:'\\to', iff:'\\iff',
  knows:'\\mathsf{K}_i', believes:'\\mathsf{B}_i', common:'C_G', distributed:'D_G',
  bullet:'\\bullet', lfi_announce:'[\\alpha]', lfi_action:'[\\mathcal U,e]', lfi_update:'[\\mathcal U,e]',
  program_box:'[\\alpha]', announce:'[!\\psi]', action_box:'[\\mathcal A,e]', arbitrary_announce:'[\\forall!]',
  concept_top:'\\top', concept_bottom:'\\bot', concept_intersection:'\\sqcap', concept_union:'\\sqcup', concept_complement:'\\neg',
  role_exists:'\\exists r.', role_forall:'\\forall r.', inverse_role:'r^{-}', nominal:'\\{a\\}',
  min_number:'\\mathord{\\geq}n\\,r', max_number:'\\mathord{\\leq}n\\,r',
  min_qualified:'\\mathord{\\geq}n\\,r.', max_qualified:'\\mathord{\\leq}n\\,r.',
  self_restriction:'\\exists r.\\mathsf{Self}', universal_role:'U',
  box:'\\Box', diamond:'\\Diamond', circle:'\\circ', nabla:'\\nabla',
  equals:'\\mathord{=}', forall_set:'\\forall X', exists_set:'\\exists X',
  forall_relation:'\\forall R^{n}', exists_relation:'\\exists R^{n}',
  forall:'\\forall', exists:'\\exists', Gamma:'\\Gamma', Delta:'\\Delta',
  proves:'\\vdash', entails:'\\models',
};
const unicode = {'¬':'\\neg','∧':'\\land','∨':'\\lor','→':'\\to','⇒':'\\Rightarrow','↔':'\\leftrightarrow','⇔':'\\Leftrightarrow','□':'\\Box','◇':'\\Diamond','◦':'\\circ','∇':'\\nabla','∀':'\\forall','∃':'\\exists','Γ':'\\Gamma','Δ':'\\Delta','⊢':'\\vdash','⊨':'\\models','⊥':'\\bot','⊤':'\\top','∅':'\\varnothing','∈':'\\in','≃':'\\simeq'};

/** Accept native TeX and the project's legacy word/Unicode notation. */
export function toLatex(value){
  let source=String(value??'').trim();
  if(source.startsWith('$$')&&source.endsWith('$$'))source=source.slice(2,-2);
  else if(source.startsWith('$')&&source.endsWith('$'))source=source.slice(1,-1);
  else if((source.startsWith('\\(')&&source.endsWith('\\)'))||(source.startsWith('\\[')&&source.endsWith('\\]')))source=source.slice(2,-2);
  // Native LaTeX (including prose inside \\text) must retain its exact meaning.
  if(/\\[a-zA-Z]+/.test(source))return source;
  return source.replace(/\\[a-zA-Z]+|[a-zA-Z][a-zA-Z0-9_]*|[¬∧∨→⇒↔⇔□◇◦∇∀∃ΓΔ⊢⊨⊥⊤∅∈≃]/g, token=>{
    if(token.startsWith('\\'))return token;
    return (operators[token]||unicode[token])?`${operators[token]||unicode[token]} `:token;
  });
}

export function math(value,displayMode=false){
  const source=toLatex(value);
  try{
    return katex.renderToString(source,{displayMode,output:'htmlAndMathml',throwOnError:true,trust:false,strict:'ignore',maxExpand:1000,maxSize:20});
  }catch{
    // A malformed formula must never prevent the rest of the record from opening.
    return `<code class="math-error" title="Invalid or unsupported LaTeX; showing source">${escape(value)}</code>`;
  }
}

/** Math in descriptive text is explicit, so names and prose are not reinterpreted. */
export function mathText(value){
  const source=String(value??'');
  const delimiters=/\$\$([\s\S]+?)\$\$|\\\[([\s\S]+?)\\\]|\\\(([\s\S]+?)\\\)|(?<!\\)\$([^$\n]+?)(?<!\\)\$/g;
  let html='',last=0;
  for(const match of source.matchAll(delimiters)){
    html+=escape(source.slice(last,match.index));
    html+=math(match[1]??match[2]??match[3]??match[4],match[1]!==undefined||match[2]!==undefined);
    last=match.index+match[0].length;
  }
  return html+escape(source.slice(last));
}

export function formula(value){
  return `<div class="formula">${math(value,true)}</div>`;
}

export function inferenceRule(premises,conclusion){
  const numerator=premises.length?premises.map(toLatex).join('\\qquad '):'\\vphantom{A}';
  return formula(`\\frac{${numerator}}{${toLatex(conclusion)}}`);
}

export function signature(operators){
  return Object.entries(operators).map(([operator,arity])=>math(`${operatorsToLatex(operator)}\\,/\\,${arity}`)).join(' ');
}

export function operatorsToLatex(operator){return operators[operator]||`\\operatorname{${String(operator).replace(/[^a-zA-Z0-9-]/g,' ')}}`;}
