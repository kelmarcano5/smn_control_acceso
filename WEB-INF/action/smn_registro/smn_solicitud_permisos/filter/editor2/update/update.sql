UPDATE smn_control_acceso.smn_solicitud_permisos SET
	spe_estatus_rf='NAP',
	spe_causa=${fld:spe_causa},
	spe_idioma='${def:locale}',
	spe_usuario='${def:user}',
	spe_fecha_registro={d '${def:date}'},
	spe_hora='${def:time}'

WHERE
	smn_solicitud_permisos_id=${fld:id}

