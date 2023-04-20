UPDATE smn_control_acceso.smn_justificaciones SET
	smn_personal_id=${fld:smn_personal_id},
	jus_descripcion=${fld:jus_descripcion},
	jus_fecha_incidencia=${fld:jus_fecha_incidencia},
	jus_hora_incidencia=${fld:jus_hora_incidencia},
	jus_tiempo_a_justificar=${fld:jus_tiempo_a_justificar},
	jus_aprobado_por=${fld:jus_aprobado_por},
	jus_archivo=${fld:_filename},
	jus_datos_imagen=?,
	jus_tamano=${fld:_filesize},
	jus_contenido=${fld:_contenttype},
	jus_idioma='${def:locale}',
	jus_usuario='${def:user}',
	jus_fecha_registro={d '${def:date}'},
	jus_hora='${def:time}'

WHERE
	smn_justificaciones_id=${fld:id}

