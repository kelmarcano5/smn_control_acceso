INSERT INTO smn_control_acceso.smn_personal_visitantes
(
	smn_personal_visitantes_id,
	smn_personal_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_estructura_organizacional_rf,
	smn_cedula_rf,
	rpv_fecha_evento,
	rpv_razon_visita,
	rpv_autorizado_almorzar,
	rpv_estatus,
	rpv_idioma,
	rpv_usuario,
	rpv_fecha_registro,
	rpv_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_personal_visitantes},
	${fld:smn_personal_id},
	${fld:smn_entidades_id},
	${fld:smn_sucursales_id},
	${fld:smn_estructura_organizacional_id},
	${fld:smn_cedula_rf},
	${fld:rpv_fecha_evento},
	${fld:rpv_razon_visita},
	${fld:rpv_autorizado_almorzar},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'

)
