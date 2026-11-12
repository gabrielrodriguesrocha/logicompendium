// Families are browsing categories; tags describe overlapping classifications.
export function filterLogics(logics,{families,tag='',recordKind='',lfiOnly=false}){
  return logics.filter(({metadata:m})=>
    families.has(m.family)&&
    (!tag||(m.tags||[]).includes(tag))&&
    (!lfiOnly||(m.tags||[]).includes('LFI'))&&
    (!recordKind||(recordKind==='family')===(m.properties?.record_kind==='Family'))
  );
}
