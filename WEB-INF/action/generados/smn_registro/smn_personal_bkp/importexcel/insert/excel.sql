INSERT INTO smn_personal
(
	smn_personal_id,
	psl_num_control,
	psl_clase_auxiliar,
	psl_auxiliar,
	psl_habilita_acceso,
	psl_id_control_acceso,
	psl_idioma,
	psl_usuario,
	psl_fecha_registro,
	psl_hora
)
VALUES
(
	${seq:nextval@seq_smn_personal},
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
