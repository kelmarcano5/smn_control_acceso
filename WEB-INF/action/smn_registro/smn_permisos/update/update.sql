UPDATE smn_control_acceso.smn_solicitud_permisos SET
	smn_personal_id=${fld:smn_personal_id},
	spe_detalles=${fld:spe_detalles},
	spe_categoria_justif=${fld:spe_categoria_justif},
	spe_fecha_desde=${fld:spe_fecha_desde},
	spe_fecha_hasta=${fld:spe_fecha_hasta},
	spe_nro_horas=${fld:spe_nro_horas},
	spe_aprobado_por=${fld:spe_aprobado_por},
	spe_idioma='${def:locale}',
	spe_usuario='${def:user}',
	spe_fecha_registro={d '${def:date}'},
	spe_hora='${def:time}'

WHERE
	smn_solicitud_permisos_id=${fld:id}

