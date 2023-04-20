select
	smn_control_acceso.smn_transacciones_desnorm.trd_sede,
	smn_control_acceso.smn_transacciones_desnorm.trd_dispositivo,
	smn_control_acceso.smn_transacciones_desnorm.trd_identificacion,
	smn_control_acceso.smn_transacciones_desnorm.trd_tipo_marcaje,
	smn_control_acceso.smn_transacciones_desnorm.trd_fecha_transaccion,
	smn_control_acceso.smn_transacciones_desnorm.trd_hora_transaccion,
	smn_control_acceso.smn_transacciones_desnorm.trd_tiempo_efectivo,
	smn_control_acceso.smn_transacciones_desnorm.trd_tiempo_efectivo_total,
	smn_control_acceso.smn_transacciones_desnorm.trd_status,
	smn_control_acceso.smn_transacciones_desnorm.trd_fecha_registro,
	smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id
from 
	smn_control_acceso.smn_transacciones_desnorm
order by
	smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id desc