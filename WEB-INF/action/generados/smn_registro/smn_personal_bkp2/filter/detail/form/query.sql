select
	(select smn_base.smn_clase_auxiliar.cla_codigo || ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_control_acceso.smn_personal.psl_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as psl_clase_auxiliar_combo,
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as psl_auxiliar_combo,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	smn_control_acceso.smn_personal.*
from 
	smn_control_acceso.smn_personal
where
	smn_control_acceso.smn_personal.smn_personal_id = ${fld:id}
