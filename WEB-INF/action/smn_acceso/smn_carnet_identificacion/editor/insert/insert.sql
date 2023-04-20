INSERT INTO smn_control_acceso.smn_carnet_identificacion
(
	smn_carnet_identificacion_id,
	cid_codigo,
	cid_descripcion,
	cid_estatus,
	cid_fecha_vigente,
	cid_idioma,
	cid_usuario,
	cid_fecha_registro,
	cid_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_carnet_identificacion},
	${fld:cid_codigo},
	${fld:cid_descripcion},
	${fld:cid_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
