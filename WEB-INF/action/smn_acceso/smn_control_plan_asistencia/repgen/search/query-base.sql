select
		smn_control_acceso.smn_control_plan_asistencia.smn_control_plan_asistencia_id,
	${field}
from
	smn_control_acceso.smn_control_plan_asistencia
where
		smn_control_acceso.smn_control_plan_asistencia.smn_control_plan_asistencia_id is not null
	${filter}
	
	
