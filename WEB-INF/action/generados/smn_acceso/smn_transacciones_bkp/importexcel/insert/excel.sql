INSERT INTO smn_transacciones
(
	smn_transacciones_id,
	trn_dispositivo,
	trn_identificacion,
	trn_fecha_transaccion,
	trn_hora_transaccion,
	trn_idioma,
	trn_usuario,
	trn_fecha_registro,
	trn_hora
)
VALUES
(
	${seq:nextval@seq_smn_transacciones},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
