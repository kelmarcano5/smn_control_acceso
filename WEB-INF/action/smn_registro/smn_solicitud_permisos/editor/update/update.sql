UPDATE smn_control_acceso.smn_solicitud_permisos SET
	smn_personal_id=${fld:smn_personal_id},
	spe_documento_rf=${fld:spe_documento_rf},
	spe_categoria_justif_rf=${fld:spe_categoria_justif_rf},
	spe_fecha_desde=${fld:spe_fecha_desde},
	spe_fecha_hasta=${fld:spe_fecha_hasta},
	spe_cantidad_horas=${fld:spe_cantidad_horas},
	spe_estatus_rf=${fld:spe_estatus_rf},
	spe_jefe_inmediato_rf=${fld:spe_jefe_inmediato_rf},
	spe_detalles=${fld:spe_detalles},
	spe_causa=${fld:spe_causa},
	spe_idioma='${def:locale}',
	spe_usuario='${def:user}',
	spe_fecha_registro={d '${def:date}'},
	spe_hora='${def:time}'

WHERE
	smn_solicitud_permisos_id=${fld:id}

