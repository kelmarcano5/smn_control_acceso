UPDATE smn_rotacion_turnos SET
	rot_turno=${fld:rot_turno},
	rot_consecutivo=${fld:rot_consecutivo},
	rot_dia=${fld:rot_dia},
	rot_horario=${fld:rot_horario},
	rot_idioma='${def:locale}',
	rot_usuario='${def:user}',
	rot_fecha_registro={d '${def:date}'},
	rot_hora='${def:time}'

WHERE
	smn_rotacion_turnos_id=${fld:id}

