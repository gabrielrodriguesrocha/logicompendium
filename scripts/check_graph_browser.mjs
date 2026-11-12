/** Optional integration check: requires Playwright and an available Chromium. */
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';

const {chromium}=createRequire(import.meta.url)(process.env.LOGIC_ATLAS_PLAYWRIGHT_MODULE||'playwright');
const browser=await chromium.launch({headless:true,...(process.env.LOGIC_ATLAS_BROWSER_EXECUTABLE?{executablePath:process.env.LOGIC_ATLAS_BROWSER_EXECUTABLE}:{})});
try{
  const page=await browser.newPage({viewport:{width:1440,height:1100}});
  page.setDefaultTimeout(10000);
  const errors=[];
  page.on('pageerror',error=>errors.push(error.message));
  // All scripts and graph assets must work without third-party network requests.
  await page.route('**/*',route=>{
    const url=new URL(route.request().url());
    return ['127.0.0.1','localhost'].includes(url.hostname)?route.continue():route.abort();
  });
  await page.addInitScript(()=>{localStorage.setItem('logic-atlas:applied','obsolete browser draft');});
  await page.goto(process.argv[2]||'http://127.0.0.1:8000/');
  await page.locator('.node').first().waitFor();
  assert.equal(await page.evaluate(()=>globalThis.d3.version),'7.9.0');
  assert.equal(await page.locator('[data-view="editor"]').count(),0);
  const response=await page.request.get(new URL('./catalog.json',page.url()).href);
  const catalog=await response.json();
  assert.equal(await page.locator('.node').count(),catalog.logics.length);
  assert.equal(await page.locator('.edge-hit').count(),catalog.relations.length);

  // One-step isolation and composable filters work in both views.
  await page.locator('#compact-family').selectOption('Modal');
  const modal=catalog.logics.filter(l=>l.metadata.family==='Modal');
  assert.equal(await page.locator('.node').count(),modal.length);
  await page.locator('#logic-tag').selectOption('Normal modal');
  const normalModal=modal.filter(l=>l.metadata.tags?.includes('Normal modal'));
  assert.equal(await page.locator('.node').count(),normalModal.length);
  await page.locator('[data-view="catalog"]').first().click();
  assert.equal(await page.locator('.logic-card').count(),normalModal.length);
  await page.getByRole('button',{name:'Clear all filters',exact:true}).click();
  await page.getByRole('button',{name:'Show only Paraconsistent logics',exact:true}).click();
  await page.locator('#logic-tag').selectOption('LFI');
  await page.locator('#record-kind').selectOption('family');
  await page.locator('#lfi-filter').click();
  assert.equal(await page.locator('#compact-family').inputValue(),'Paraconsistent');
  assert.equal(await page.locator('#logic-tag').inputValue(),'LFI');
  assert.equal(await page.locator('.logic-card').count(),catalog.logics.filter(l=>l.metadata.family==='Paraconsistent'&&l.metadata.tags?.includes('LFI')&&l.metadata.properties?.record_kind==='Family').length);
  await page.getByRole('button',{name:'Clear all filters',exact:true}).click();
  await page.locator('[data-view="graph"]').first().click();
  assert.equal(await page.locator('.node').count(),catalog.logics.length);

  // Property labels must not apply block layout or capitalization to KaTeX spans.
  // Check both inline consistency formulas and long description-logic grammars.
  assert.equal(await page.locator('[data-node="Cn"]').count(),1);
  assert.equal(await page.locator('[data-node]').evaluateAll(nodes=>nodes.filter(node=>/^C\d+$/.test(node.dataset.node)).length),0);
  for(const id of ['Cn','SROIQ','KLFI1','PALFI1','UMLFI1']){
    await page.locator(`[data-node="${id}"]`).dblclick();
    await page.locator('#detail-dialog[open]').waitFor();
    const properties=page.locator('.property-grid');
    assert.ok(await properties.locator('.katex').count()>0);
    assert.equal(await properties.locator('.math-error').count(),0);
    await page.evaluate(()=>document.fonts.ready);
    const metrics=await properties.evaluate(grid=>({
      labels:[...grid.querySelectorAll('.property>span')].map(el=>({display:getComputedStyle(el).display,textTransform:getComputedStyle(el).textTransform})),
      formulas:[...grid.querySelectorAll('.katex')].map(el=>({display:getComputedStyle(el).display,textTransform:getComputedStyle(el).textTransform,margin:getComputedStyle(el).marginBottom})),
      contained:[...grid.querySelectorAll('.property')].every(el=>el.getBoundingClientRect().right<=grid.getBoundingClientRect().right+1),
    }));
    assert.ok(metrics.labels.every(label=>label.display==='block'&&label.textTransform==='capitalize'));
    assert.ok(metrics.formulas.every(formula=>formula.display==='inline'&&formula.textTransform==='none'&&formula.margin==='0px'));
    assert.ok(metrics.contained);
    if(id==='SROIQ'){
      await page.setViewportSize({width:390,height:844});
      assert.ok(await properties.evaluate(grid=>[...grid.querySelectorAll('.property')].every(el=>el.getBoundingClientRect().right<=grid.getBoundingClientRect().right+1)));
      await page.setViewportSize({width:1440,height:1100});
    }
    await page.keyboard.press('Escape');
  }

  // Keyed updates retain the actual node, SVG, camera and keyboard focus.
  const node=page.locator('[data-node="SROIQ"]');
  await page.evaluate(()=>{
    globalThis.retainedSVG=document.querySelector('svg.graph');
    globalThis.retainedNode=document.querySelector('[data-node="SROIQ"]');
  });
  await node.click();
  assert.equal(await node.getAttribute('aria-pressed'),'true');
  assert.ok(await page.evaluate(()=>retainedNode===document.querySelector('[data-node="SROIQ"]')&&retainedSVG===document.querySelector('svg.graph')));
  await node.focus();await page.keyboard.press('Enter');
  await page.locator('#detail-dialog[open]').waitFor();
  assert.equal(await page.locator('#detail-content h2').textContent(),'SROIQ');
  await page.keyboard.press('Escape');
  await node.dblclick();await page.locator('#detail-dialog[open]').waitFor();
  await page.keyboard.press('Escape');

  // One D3 camera handles buttons, wheel gestures, dragging and Fit.
  const transform=()=>page.locator('#graph-scene').getAttribute('transform');
  const fitted=await transform();
  await page.getByRole('button',{name:'Zoom in',exact:true}).click();
  const zoomed=await transform();assert.notEqual(zoomed,fitted);
  await node.click();assert.equal(await transform(),zoomed);
  const box=await page.locator('svg.graph').boundingBox();
  await page.mouse.move(box.x+25,box.y+25);await page.mouse.wheel(0,-200);
  await page.waitForFunction(previous=>document.querySelector('#graph-scene').getAttribute('transform')!==previous,zoomed);
  const wheeled=await transform();
  await page.mouse.move(box.x+25,box.y+25);await page.mouse.down();
  await page.mouse.move(box.x+80,box.y+55,{steps:5});await page.mouse.up();
  assert.notEqual(await transform(),wheeled);
  await page.getByRole('button',{name:'Fit map',exact:true}).click();
  assert.equal(await transform(),fitted);

  // Filtering updates joins and relationship indices without replacing the SVG.
  for(const family of new Set(catalog.logics.map(item=>item.metadata.family))){
    if(family!=='Description')await page.locator(`[data-family=${JSON.stringify(family)}]`).click();
  }
  assert.equal(await page.locator('.node').count(),catalog.logics.filter(l=>l.metadata.family==='Description').length);
  assert.ok(await page.evaluate(()=>retainedSVG===document.querySelector('svg.graph')&&retainedNode===document.querySelector('[data-node="SROIQ"]')));
  await page.getByRole('button',{name:/Relationships/}).click();
  const expansions=page.locator('[data-type="language_extension"]');
  await expansions.uncheck();
  assert.equal(await page.locator('.edge.language_extension').count(),0);
  await expansions.check();
  const edge=page.locator('.edge-hit').first();
  const index=Number(await edge.getAttribute('data-relation'));
  const edgeData=catalog.relations[index];
  await edge.focus();await page.keyboard.press('Space');
  await page.locator('#detail-dialog[open]').waitFor();
  assert.ok((await page.locator('#detail-content').textContent()).includes(edgeData.description));
  await page.keyboard.press('Escape');
  await page.getByRole('button',{name:/Relationships/}).click();
  await page.locator('#search').fill('no-such-logic-xyz');
  await page.locator('#map-empty').waitFor({state:'visible'});
  assert.equal(await page.locator('.node').count(),0);
  assert.equal(await page.locator('.edge-hit').count(),0);
  await page.locator('#search').fill('');
  assert.ok(await page.locator('.node').count()>0);
  await page.locator('#search').blur();

  // Switching views disposes the old renderer and restores the map cleanly.
  await page.keyboard.press('2');await page.locator('.logic-card').first().waitFor();
  await page.locator('[data-compare="ALC"]').check();
  await page.locator('[data-compare="SROIQ"]').check();
  await page.locator('[data-view="graph"]').first().click();
  await page.locator('.node').first().waitFor();
  assert.equal(await page.locator('.node-comparison:not([display="none"])').count(),2);
  assert.equal(await page.locator('#logic-atlas-arrow').count(),1);
  await page.setViewportSize({width:390,height:844});
  await page.locator('#compact-family').selectOption('Modal');
  assert.equal(await page.locator('.node').count(),modal.length);
  assert.ok(await page.locator('#logic-tag').isVisible());
  assert.ok(await page.locator('#record-kind').isVisible());
  await page.getByRole('button',{name:'Fit map',exact:true}).click();
  assert.ok(await page.locator('svg.graph').isVisible());
  assert.deepEqual(errors,[]);
  console.log('Browser checks passed: property formula layout, offline D3 render, joins, selection, details, zoom/pan/fit, filters, edge keyboard access, empty state, comparison, navigation and mobile viewport.');
}finally{
  await browser.close();
}
