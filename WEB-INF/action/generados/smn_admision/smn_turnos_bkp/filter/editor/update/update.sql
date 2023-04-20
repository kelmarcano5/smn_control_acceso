UPDATE smn_turnos SET
	tur_codigo=${fld:tur_codigo},
	tur_nombre=${fld:tur_nombre},
	tur_idioma='${def:locale}',
	tur_usuario='${def:user}',
	tur_fecha_registro={d '${def:date}'},
	tur_hora='${def:time}'

WHERE
	smn_turnos_id=${fld:id}

