select
	smn_control_acceso.smn_transacciones_desnorm.trd_sede,
	smn_control_acceso.smn_transacciones_desnorm.trd_dispositivo,
	smn_control_acceso.smn_transacciones_desnorm.trd_identificacion,
	smn_control_acceso.smn_transacciones_desnorm.trd_tipo_marcaje,
	smn_control_acceso.smn_transacciones_desnorm.trd_fecha_transaccion,
	smn_control_acceso.smn_transacciones_desnorm.trd_hora_transaccion,
	smn_control_acceso.smn_transacciones_desnorm.trd_tiempo_efectivo,
	smn_control_acceso.smn_transacciones_desnorm.trd_tiempo_efectivo_total,
	case 
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'ESC' then 'OK  | ESC - Correcto'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'ESI' then 'ERR | ESI - Secuencia sospechosa'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'FEN' then 'ERR | FEN - Faltan entradas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'FSA' then 'ERR | FSA - Faltan salidas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'FES' then 'ERR | FES - Faltan entradas y salidas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'SEN' then 'ERR | SEN - Registró sólo entradas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'SSA' then 'ERR | SSA - Registró sólo salidas'
	end as trd_status,
	smn_control_acceso.smn_transacciones_desnorm.trd_fecha_registro,
	smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id
from
	smn_control_acceso.smn_transacciones_desnorm
where
	smn_control_acceso.smn_transacciones_desnorm.smn_transacciones_desnorm_id = ${fld:id}
