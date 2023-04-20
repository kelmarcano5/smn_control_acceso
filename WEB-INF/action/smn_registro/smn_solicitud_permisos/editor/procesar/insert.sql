INSERT INTO smn_control_acceso.smn_solicitud_permisos
(
	smn_solicitud_permisos_id,
	smn_personal_id,
	spe_documento_rf,
	spe_categoria_justif_rf,
	spe_fecha_desde,
	spe_fecha_hasta,
	spe_cantidad_horas,
	spe_estatus_rf,
	spe_jefe_inmediato_rf,
	spe_detalles,
	spe_causa,
	spe_idioma,
	spe_usuario,
	spe_fecha_registro,
	spe_hora,
	spe_cantidad_dias
)
VALUES(
	nextval('smn_control_acceso.seq_smn_solicitud_permisos'),
	${fld:smn_personal_id},
	${fld:spe_documento_rf},
	${fld:spe_categoria_justif_rf},
	${fld:spe_fecha_desde},
	${fld:spe_fecha_hasta},
	${fld:spe_cantidad_horas},
	${fld:spe_estatus_rf},
	${fld:spe_jefe_inmediato_rf},
	${fld:spe_detalles},
	${fld:spe_causa},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:spe_cantidad_dias}
)
RETURNING smn_solicitud_permisos_id, spe_cantidad_dias;