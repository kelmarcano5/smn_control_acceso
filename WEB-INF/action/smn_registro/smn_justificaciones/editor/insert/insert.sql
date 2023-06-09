INSERT INTO smn_control_acceso.smn_justificaciones
(
	smn_justificaciones_id,
	smn_personal_id,
	jus_tipo_actividad_rf,
	jus_documento_rf,
	jus_fecha_incidencia,
	jus_hora_incidencia,
	jus_tiempo_a_justificar,
	jus_estatus_rf,
	jus_jefe_inmediato_rf,
	jus_descripcion,
	jus_causa,
	jus_idioma,
	jus_usuario,
	jus_fecha_registro,
	jus_hora,
	smn_categoria_justificacion_id
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_justificaciones},
	${fld:smn_personal_id},
	${fld:jus_tipo_actividad_rf},
	${fld:jus_documento_rf},
	${fld:jus_fecha_incidencia},
	${fld:jus_hora_incidencia},
	${fld:jus_tiempo_a_justificar},
	${fld:jus_estatus_rf},
	${fld:jus_jefe_inmediato_rf},
	${fld:jus_descripcion},
	${fld:jus_causa},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_categoria_justificacion_id}
)
