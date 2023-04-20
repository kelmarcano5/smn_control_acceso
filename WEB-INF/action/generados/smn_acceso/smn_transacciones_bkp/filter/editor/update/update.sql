UPDATE smn_transacciones SET
	trn_dispositivo=${fld:trn_dispositivo},
	trn_identificacion=${fld:trn_identificacion},
	trn_fecha_transaccion=${fld:trn_fecha_transaccion},
	trn_hora_transaccion=${fld:trn_hora_transaccion},
	trn_idioma='${def:locale}',
	trn_usuario='${def:user}',
	trn_fecha_registro={d '${def:date}'},
	trn_hora='${def:time}'

WHERE
	smn_transacciones_id=${fld:id}

