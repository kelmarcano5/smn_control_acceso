select
	smn_control_acceso.smn_transacciones.trn_dispositivo,
	smn_control_acceso.smn_transacciones.trn_identificacion,
	smn_control_acceso.smn_transacciones.trn_fecha_transaccion,
	smn_control_acceso.smn_transacciones.trn_hora_transaccion,
	smn_control_acceso.smn_transacciones.trn_fecha_registro
from 
	smn_control_acceso.smn_transacciones
order by 
	smn_control_acceso.smn_transacciones.smn_transacciones_id desc