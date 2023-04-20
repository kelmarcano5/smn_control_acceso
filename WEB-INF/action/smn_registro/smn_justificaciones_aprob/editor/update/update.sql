UPDATE smn_control_acceso.smn_justificaciones SET
	smn_personal_id=${fld:smn_personal_id},
	jus_tipo_actividad_rf=${fld:jus_tipo_actividad_rf},
	jus_documento_rf=${fld:jus_documento_rf},
	jus_fecha_incidencia=${fld:jus_fecha_incidencia},
	jus_hora_incidencia=${fld:jus_hora_incidencia},
	jus_tiempo_a_justificar=${fld:jus_tiempo_a_justificar},
	jus_estatus_rf=${fld:jus_estatus_rf},
	jus_jefe_inmediato_rf=${fld:jus_jefe_inmediato_rf},
	jus_descripcion=${fld:jus_descripcion},
	jus_causa=${fld:jus_causa},
	jus_idioma='${def:locale}',
	jus_usuario='${def:user}',
	jus_fecha_registro={d '${def:date}'},
	jus_hora='${def:time}'

WHERE
	smn_justificaciones_id=${fld:id}

