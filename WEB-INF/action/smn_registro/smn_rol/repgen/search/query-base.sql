select
		smn_control_acceso.smn_rol.smn_rol_id,
	${field}
from
	smn_control_acceso.smn_rol
where
		smn_control_acceso.smn_rol.smn_rol_id is not null
	${filter}
	
	
