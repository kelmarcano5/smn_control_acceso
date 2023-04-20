INSERT INTO smn_control_acceso.smn_turnos
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
	${seq:nextval@smn_control_acceso.seq_smn_turnos},
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
