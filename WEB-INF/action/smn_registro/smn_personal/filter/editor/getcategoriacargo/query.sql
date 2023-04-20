SELECT 
smn_gip.smn_cargos.smn_cargos_id as id, 
smn_gip.smn_cargos.job_codigo || ' - ' || 
smn_gip.smn_cargos.job_nombre as item from smn_gip.smn_cargos
left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id  = smn_gip.smn_cargos.smn_categoria_cargos_id
where smn_gip.smn_categoria_cargos.smn_categoria_cargos_id=${fld:id}
 order by job_nombre