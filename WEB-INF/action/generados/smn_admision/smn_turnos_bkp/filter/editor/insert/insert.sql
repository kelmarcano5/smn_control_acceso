INSERT INTO smn_turnos
(
	smn_turnos_id,
	tur_codigo,
	tur_nombre,
	tur_idioma,
	tur_usuario,
	tur_fecha_registro,
	tur_hora
)
VALUES
(
	${seq:currval@seq_smn_turnos},
	${fld:tur_codigo},
	${fld:tur_nombre},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
