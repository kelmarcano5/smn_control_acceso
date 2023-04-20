select
	smn_control_acceso.smn_transacciones.smn_transacciones_id,
	${field}
from
	smn_control_acceso.smn_transacciones
where
	smn_control_acceso.smn_transacciones.smn_transacciones_id is not null
	${filter}
	
	
