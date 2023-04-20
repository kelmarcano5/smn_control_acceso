select
		smn_control_acceso.smn_rotacion_turnos.smn_rotacion_turnos_id,
	${field}
from
	smn_control_acceso.smn_rotacion_turnos
where
		smn_control_acceso.smn_rotacion_turnos.smn_rotacion_turnos_id is not null
	${filter}
	
	
