import test from 'node:test';
import assert from 'node:assert/strict';
import {fitTransform,edgePath} from '../web/graph.mjs';

test('fit transforms keep wide, tall and single-node maps inside the viewport',()=>{
  for(const points of [[[0,0]],[[0,0],[4000,100]],[[10,10],[10,20000]]]){
    const transform=fitTransform(points);
    for(const point of points){
      const [x,y]=transform.apply(point);
      assert.ok(x>=0&&x<=1120&&y>=0&&y<=530);
      assert.ok(x-61*transform.k>=0&&x+61*transform.k<=1120);
      assert.ok(y-35*transform.k>=0&&y+35*transform.k<=530);
      assert.deepEqual(transform.invert([x,y]).map(Math.round),point);
    }
  }
});

test('an empty map has an identity transform rather than infinite bounds',()=>{
  const transform=fitTransform([]);
  assert.deepEqual([transform.x,transform.y,transform.k],[0,0,1]);
});

test('edges meet node boundaries and retain their curves under stable relation keys',()=>{
  const horizontal=edgePath([100,100],[400,100],3);
  assert.match(horizontal.d,/^M161,100Q/);
  assert.match(horizontal.d,/,335,100$/);
  const vertical=edgePath([100,100],[100,400],4);
  assert.match(vertical.d,/^M100,135Q/);
  assert.match(vertical.d,/,100,361$/);
  assert.notEqual(edgePath([100,100],[400,100],2).d,horizontal.d);
  assert.deepEqual(edgePath([100,100],[400,100],3),horizontal);
});

test('coincident endpoints do not emit invalid SVG coordinates',()=>{
  const edge=edgePath([100,100],[100,100],0);
  assert.ok(!/NaN|Infinity/.test(edge.d));
  assert.ok(Number.isFinite(edge.mx)&&Number.isFinite(edge.my));
});
