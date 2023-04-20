UPDATE smn_control_acceso.smn_personal SET
	psl_esquema_rotacion_rf=${fld:esquema_rotacion_nuevo},
	psl_idioma='${def:locale}',
	psl_usuario='${def:user}',
	psl_fecha_registro={d '${def:date}'},
	psl_hora='${def:time}'

WHERE
	smn_personal_id=${fld:id}

