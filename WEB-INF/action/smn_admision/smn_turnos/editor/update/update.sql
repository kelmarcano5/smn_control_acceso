UPDATE smn_control_acceso.smn_turnos SET
	tur_codigo=${fld:tur_codigo},
	tur_nombre=${fld:tur_nombre},
	tur_idioma='${def:locale}',
	tur_usuario='${def:user}'
WHERE
	smn_control_acceso.smn_turnos.smn_turnos_id=${fld:id}

