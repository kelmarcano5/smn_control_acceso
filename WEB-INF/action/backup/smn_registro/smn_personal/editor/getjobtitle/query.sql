select
	smn_gip.smn_cargos.smn_cargos_id as id, 
	smn_gip.smn_cargos.job_codigo || ' - ' || smn_gip.smn_cargos.job_nombre as item
from 
	smn_gip.smn_cargos
where
	smn_gip.smn_cargos.smn_categoria_cargos_id =(select
													smn_gip.smn_categoria_cargos.smn_categoria_cargos_id
								                 from 
								                    smn_gip.smn_categoria_cargos
								                 where
								                    upper(smn_gip.smn_categoria_cargos.cac_nombre)=upper(${fld:id}))
order by 
	smn_gip.smn_cargos.smn_cargos_id
	
	

	
