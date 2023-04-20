select
		smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id,
	${field}
from
	smn_control_acceso.smn_transacciones_desnorm
where
		smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id is not null
	${filter}
	
	
