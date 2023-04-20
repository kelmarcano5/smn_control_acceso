select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	${field}
from
	smn_base.smn_v_auxiliar,
	smn_base.smn_clase_auxiliar,
	smn_control_acceso.smn_personal
where
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar and
		smn_control_acceso.smn_personal.smn_personal_id = ${fld:id}
	
