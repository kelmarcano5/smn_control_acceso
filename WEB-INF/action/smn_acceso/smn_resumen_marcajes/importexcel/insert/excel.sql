INSERT INTO smn_control_acceso.smn_resumen_marcajes
(
	smn_resumen_marcajes_id,
	igs_auxiliar,
	igs_clase_auxiliar,
	igs_control_acceso_id,
	igs_actividad,
	igs_tiempo_efectivo,
	igs_fecha,
	igs_idioma,
	igs_usuario,
	igs_fecha_registro,
	igs_hora
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_resumen_marcajes},
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
