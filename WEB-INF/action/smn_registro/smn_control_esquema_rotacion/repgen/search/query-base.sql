select
		smn_gip.smn_control_esquema_rotacion.smn_control_esquema_rotacion_id,
	${field}
from
	smn_gip.smn_control_esquema_rotacion
where
		smn_gip.smn_control_esquema_rotacion.smn_control_esquema_rotacion_id is not null
	${filter}
	
	
