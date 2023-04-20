select
		smn_control_acceso.smn_carnet_identificacion.smn_carnet_identificacion_id,
	${field}
from
	smn_control_acceso.smn_carnet_identificacion
where
		smn_control_acceso.smn_carnet_identificacion.smn_carnet_identificacion_id is not null
	${filter}
	
	
