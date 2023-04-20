INSERT INTO smn_gip.smn_control_esquema_rotacion
(
	smn_control_esquema_rotacion_id,
	smn_personal_id,
	smn_esquema_rotacion_actual_rf,
	smn_esquema_rotacion_nuevo_rf,
	cer_fecha_vigencia,
	cer_fecha_registro
)
VALUES
(
	${seq:nextval@smn_gip.seq_smn_control_esquema_rotacion},
	?,
	?,
	?,
	{d '${def:date}'},
	{d '${def:date}'}
)
