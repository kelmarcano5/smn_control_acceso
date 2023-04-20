UPDATE smn_control_acceso.smn_justificaciones_soporte SET
	smn_justificaciones_id=${fld:smn_justificaciones_id},
	smn_personal_rf=${fld:smn_personal_rf},
	jsa_description=${fld:jsa_description},
	jsa_idioma='${def:locale}',
	jsa_usuario='${def:user}',
	jsa_fecha_registro={d '${def:date}'},
	jsa_hora='${def:time}'

WHERE
	smn_justificaciones_soporte_id=${fld:id}

