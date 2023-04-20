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
	${seq:nextval@smn_control_acceso.seq_smn_justificaciones},
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
