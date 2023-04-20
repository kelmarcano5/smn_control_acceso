INSERT INTO smn_control_acceso.smn_rotacion_turnos
(
	smn_rotacion_turnos_id,
	rot_turno,
	rot_consecutivo,
	rot_dia,
	rot_horario,
	rot_idioma,
	rot_usuario,
	rot_fecha_registro,
	rot_hora
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_rotacion_turnos},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
