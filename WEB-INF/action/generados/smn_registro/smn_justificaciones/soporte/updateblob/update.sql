UPDATE smn_control_acceso.smn_justificaciones_soporte SET
	smn_justificaciones_id=${fld:smn_justificaciones_id},
	jsa_persona_rf=${fld:jsa_persona_rf},
	jsa_archivo=${fld:_filename},
	jsa_datos_imagen=?,
	jsa_tamano=${fld:_filesize},
	jsa_archivo=${fld:_filenametemp},
	jsa_contenido=${fld:_contenttype},
	jsa_idioma='${def:locale}',
	jsa_usuario='${def:user}',
	jsa_fecha_registro={d '${def:date}'},
	jsa_hora='${def:time}'

WHERE
	smn_justificaciones_soporte_id=${fld:id}

