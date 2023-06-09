INSERT INTO smn_control_acceso.smn_transacciones_desnorm
(
	smn_transacciones_desnorm_id,
	trd_sede,
	trd_dispositivo,
	trd_identificacion,
	trd_tipo_marcaje,
	trd_fecha_transaccion,
	trd_hora_transaccion,
	trd_tiempo_efectivo,
	trd_tiempo_efectivo_total,
	trd_status,
	trd_idioma,
	trd_usuario,
	trd_fecha_registro,
	trd_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_transacciones_desnorm},
	${fld:trd_sede},
	${fld:trd_dispositivo},
	${fld:trd_identificacion},
	${fld:trd_tipo_marcaje},
	${fld:trd_fecha_transaccion},
	${fld:trd_hora_transaccion},
	${fld:trd_tiempo_efectivo},
	${fld:trd_tiempo_efectivo_total},
	${fld:trd_status},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
