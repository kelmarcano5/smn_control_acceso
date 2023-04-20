UPDATE smn_control_acceso.smn_asistencias SET
	asi_id_control_acceso=${fld:asi_id_control_acceso},
	asi_clase_auxiliar_rf=${fld:asi_clase_auxiliar_rf},
	asi_auxiliar_rf=${fld:asi_auxiliar_rf},
	asi_fecha=${fld:asi_fecha},
	asi_estatus_permiso_rf=${fld:asi_estatus_permiso_rf},
	asi_turno_rf=${fld:asi_turno_rf},
	asi_esquema_rotacion_rf=${fld:asi_esquema_rotacion_rf},
	asi_hora_ent_turno1=${fld:asi_hora_ent_turno1},
	asi_hora_sal_turno1=${fld:asi_hora_sal_turno1},
	asi_hora_ent_turno2=${fld:asi_hora_ent_turno2},
	asi_hora_sal_turno2=${fld:asi_hora_sal_turno2},
	asi_horas_trabajadas=${fld:asi_horas_trabajadas},
	asi_horas_descansos=${fld:asi_horas_descansos},
	asi_estatus_asistencia_rf=${fld:asi_estatus_asistencia_rf},
	asi_idioma='${def:locale}',
	asi_usuario='${def:user}',
	asi_fecha_registro={d '${def:date}'},
	asi_hora='${def:time}'

WHERE
	smn_asistencias_id=${fld:id}

