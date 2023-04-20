select
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id,
	${field}
from
	smn_control_acceso.smn_transacciones_manuales
where
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id is not null
	${filter}
	
	
