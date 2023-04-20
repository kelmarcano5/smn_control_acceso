INSERT INTO smn_control_acceso.smn_asistencia_comedor
(
	smn_asistencia_comedor_id,
	smn_asistencia_id,
	smn_movimiento_marcaje_id,
	smn_personal_id,
	com_fecha_generada,
	com_hora_generada,
	com_hora_marcaje,
	com_hora_entregada,
	com_estatus,
	com_fecha_registro
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_asistencia_comedor},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
