UPDATE smn_control_acceso.smn_transacciones SET
	trn_dispositivo=${fld:trn_dispositivo},
	trn_identificacion=${fld:trn_identificacion},
	trn_fecha_transaccion=${fld:trn_fecha_transaccion},
	trn_hora_transaccion=${fld:trn_hora_transaccion},
	trn_idioma='${def:locale}',
	trn_usuario='${def:user}'
WHERE
	smn_transacciones_id=${fld:id}

