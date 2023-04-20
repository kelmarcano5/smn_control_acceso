select
	smn_base.smn_v_auxiliar.smn_clase_id as id, 
	smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item as item
from 
	smn_base.smn_v_auxiliar
where
	smn_base.smn_v_auxiliar.smn_clase_id =(select
												smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id
							               from 
							                    smn_base.smn_clase_auxiliar
							               where
							                    upper(smn_base.smn_clase_auxiliar.cla_nombre)=upper(${fld:id}))
order by 
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id
	
	

	
