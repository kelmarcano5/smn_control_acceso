INSERT INTO smn_gip.smn_control_esquema_rotacion
(
	smn_control_esquema_rotacion_id,
	smn_personal_id,
	smn_esquema_rotacion_actual_rf,
	smn_esquema_rotacion_nuevo_rf,
	cer_fecha_vigencia,
	cer_idioma,
	cer_usuario,
	cer_fecha_registro,
	cer_hora
)
VALUES
(
	${seq:currval@smn_gip.seq_smn_control_esquema_rotacion},
	${fld:smn_personal_id},
	${fld:smn_esquema_rotacion_actual_rf},
	${fld:smn_esquema_rotacion_nuevo_rf},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
