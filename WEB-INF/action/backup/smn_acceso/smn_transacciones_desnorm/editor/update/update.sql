UPDATE smn_control_acceso.smn_transacciones_desnorm SET
	trd_sede=${fld:trd_sede},
	trd_dispositivo=${fld:trd_dispositivo},
	trd_identificacion=${fld:trd_identificacion},
	trd_tipo_marcaje=${fld:trd_tipo_marcaje},
	trd_fecha_transaccion=${fld:trd_fecha_transaccion},
	trd_hora_transaccion=${fld:trd_hora_transaccion},
	trd_tiempo_efectivo=${fld:trd_tiempo_efectivo},
	trd_tiempo_efectivo_total=${fld:trd_tiempo_efectivo_total},
	trd_status=${fld:trd_status},
	trd_idioma='${def:locale}',
	trd_usuario='${def:user}',
	trd_fecha_registro={d '${def:date}'},
	trd_hora='${def:time}'

WHERE
	smn_transacciones_desnorm_id=${fld:id}

