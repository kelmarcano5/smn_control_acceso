select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	(select
		smn_base.smn_v_auxiliar.smn_item
	 from 
	 	smn_base.smn_v_auxiliar
	 where 
	 	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = ${fld:psl_auxiliar_filter}) as auxiliar_filter,
	(select
		smn_base.smn_clase_auxiliar.cla_nombre
	 from 
	 	smn_base.smn_clase_auxiliar
	 where 
	 	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = ${fld:psl_clase_auxiliar_filter}) as clase_auxiliar_filter,
	smn_control_acceso.smn_personal.smn_personal_id,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	case
		when ${fld:psl_habilita_acceso_filter}='S' then '${lbl:b_yes}'
		when ${fld:psl_habilita_acceso_filter}='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo_filter,
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
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar 
and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar 
and
	smn_control_acceso.smn_personal.smn_personal_id = ${fld:id}
