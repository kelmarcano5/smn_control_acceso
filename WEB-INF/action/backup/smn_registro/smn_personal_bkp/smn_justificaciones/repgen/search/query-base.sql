select
		smn_control_acceso.smn_justificaciones.smn_justificaciones_id,
	${field}
from
	smn_control_acceso.smn_justificaciones
where
		smn_control_acceso.smn_justificaciones.smn_justificaciones_id is not null
	${filter}
	
	
