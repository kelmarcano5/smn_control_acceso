UPDATE smn_gip.smn_control_esquema_rotacion SET
	smn_personal_id=${fld:smn_personal_id},
	smn_esquema_rotacion_actual_rf=${fld:smn_esquema_rotacion_actual_rf},
	smn_esquema_rotacion_nuevo_rf=${fld:smn_esquema_rotacion_nuevo_rf},
	cer_fecha_vigencia={d '${def:date}'},
	cer_idioma='${def:locale}',
	cer_usuario='${def:user}',
	cer_fecha_registro={d '${def:date}'},
	cer_hora='${def:time}'

WHERE
	smn_control_esquema_rotacion_id=${fld:id}

