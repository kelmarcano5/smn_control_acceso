UPDATE smn_control_acceso.smn_asistencia SET
	smn_plan_asistencia_id=${fld:smn_plan_asistencia_id},
	asi_id_control_acceso=${fld:asi_id_control_acceso},
	asi_personal_rf=${fld:asi_personal_rf},
	asi_fecha_evento=${fld:asi_fecha_evento},
	asi_dia_evento=${fld:asi_dia_evento},
	asi_turno_rf=${fld:asi_turno_rf},
	asi_esquema_rotacion_rf=${fld:asi_esquema_rotacion_rf},
	asi_tipo_marcaje=${fld:asi_tipo_marcaje},
	asi_hora_tope_evento=${fld:asi_hora_tope_evento},
	asi_hora_marcaje=${fld:asi_hora_marcaje},
	asi_secuencia_tipo_marcaje=${fld:asi_secuencia_tipo_marcaje},
	smn_codigo_variable_1=${fld:smn_codigo_variable_1},
	asi_variable_1=${fld:asi_variable_1},
	smn_codigo_variable_2=${fld:smn_codigo_variable_2},
	asi_variable_2=${fld:asi_variable_2},
	asi_idioma='${def:locale}',
	asi_usuario='${def:user}',
	asi_fecha_registro={d '${def:date}'},
	asi_hora='${def:time}',
	asi_estatus_entrada='AS'

WHERE
	smn_asistencia_id=${fld:id}

