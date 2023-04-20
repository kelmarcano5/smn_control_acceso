select
		smn_base.smn_plan_asistencia.smn_plan_asistencia_id,
	${field}
from
	smn_base.smn_plan_asistencia
where
		smn_base.smn_plan_asistencia.smn_plan_asistencia_id is not null
	${filter}
	
	
