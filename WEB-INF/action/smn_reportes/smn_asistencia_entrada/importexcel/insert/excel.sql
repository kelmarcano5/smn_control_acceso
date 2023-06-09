INSERT INTO smn_control_acceso.smn_asistencia
(
	smn_asistencia_id,
	smn_plan_asistencia_id,
	asi_id_control_acceso,
	asi_personal_rf,
	asi_fecha_evento,
	asi_dia_evento,
	asi_turno_rf,
	asi_esquema_rotacion_rf,
	asi_tipo_marcaje,
	asi_hora_tope_evento,
	asi_estatus_permiso_rf,
	asi_estatus_asistencia_rf,
	asi_fecha_registro,
	asi_hora_marcaje,
	asi_estatus_marcaje,
	asi_secuencia_tipo_marcaje,
	smn_codigo_variable_1,
	asi_variable_1,
	smn_codigo_variable_2,
	asi_variable_1
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_asistencia},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'},
	?,
	?,
	?,
	?,
	?,
	?,
	?
)
