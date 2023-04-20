INSERT INTO smn_control_acceso.smn_justificaciones
(
	smn_justificaciones_id,
	smn_personal_id,
	jus_descripcion,
	jus_fecha_incidencia,
	jus_hora_incidencia,
	jus_tiempo_a_justificar,
	jus_aprobado_por,
	jus_idioma,
	jus_usuario,
	jus_fecha_registro,
	jus_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_justificaciones},
	${fld:smn_personal_id},
	${fld:jus_descripcion},
	${fld:jus_fecha_incidencia},
	${fld:jus_hora_incidencia},
	${fld:jus_tiempo_a_justificar},
	${fld:jus_aprobado_por},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
