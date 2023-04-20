UPDATE smn_control_acceso.smn_transacciones_manuales SET
	trm_sede=${fld:trm_sede},
	trm_dispositivo=${fld:trm_dispositivo},
	trm_identificacion=${fld:trm_identificacion},
	trm_marcaje=${fld:trm_marcaje},
	trm_tipo_marcaje=${fld:trm_tipo_marcaje},
	trm_fecha_transaccion=${fld:trm_fecha_transaccion},
	trm_hora_transaccion=${fld:trm_hora_transaccion},
	trm_jutificacion=${fld:trm_jutificacion},
	trm_idioma='${def:locale}',
	trm_usuario='${def:user}',
	trm_fecha_registro={d '${def:date}'},
	trm_hora='${def:time}'

WHERE
	smn_transacciones_manuales_id=${fld:id}

