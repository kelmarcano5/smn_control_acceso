select
	smn_control_acceso.smn_transacciones_desnorm.*
from
	smn_control_acceso.smn_transacciones_desnorm
where
		smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id = ${fld:id}
