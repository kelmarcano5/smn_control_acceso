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
	${seq:currval@smn_control_acceso.seq_smn_rotacion_turnos},
	${fld:rot_turno},
	${fld:rot_consecutivo},
	${fld:rot_dia},
	${fld:rot_horario},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
