select
	smn_control_acceso.smn_transacciones.*
from 
	smn_control_acceso.smn_transacciones
where
	smn_control_acceso.smn_transacciones.smn_transacciones_id = ${fld:id}
