UPDATE smn_control_acceso.smn_rotacion_turnos SET
	rot_turno=${fld:rot_turno},
	rot_consecutivo=${fld:rot_consecutivo},
	rot_dia=${fld:rot_dia},
	rot_horario=${fld:rot_horario},
	rot_idioma='${def:locale}',
	rot_usuario='${def:user}'
WHERE
	smn_control_acceso.smn_rotacion_turnos.smn_rotacion_turnos_id=${fld:id}

