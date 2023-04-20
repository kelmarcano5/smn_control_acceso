select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_control_acceso.smn_personal.smn_personal_id,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	smn_control_acceso.smn_personal.psl_num_control,
	smn_control_acceso.smn_personal.psl_clase_auxiliar,
	smn_control_acceso.smn_personal.psl_auxiliar,
	smn_control_acceso.smn_personal.psl_habilita_acceso,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_personal.psl_fecha_registro
from
	smn_base.smn_v_auxiliar,
	smn_base.smn_clase_auxiliar,
	smn_control_acceso.smn_personal
where
	smn_control_acceso.smn_personal.smn_personal_id is not null
and
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar 
and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar 
and
   	smn_control_acceso.smn_personal.pls_idioma = '${def:locale}'
and
	smn_control_acceso.smn_personal.pls_usuario = '${def:user}'
	${filter}
order by
	smn_control_acceso.smn_personal.smn_personal_id desc
