select
	${field},
	smn_control_acceso.smn_asistencia_comedor.smn_asistencia_comedor_id,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| aux_descripcion as smn_personal_id
from
	smn_control_acceso.smn_asistencia_comedor
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia_comedor.smn_personal_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
where
	smn_control_acceso.smn_asistencia_comedor.smn_asistencia_comedor_id is not null
	${filter}