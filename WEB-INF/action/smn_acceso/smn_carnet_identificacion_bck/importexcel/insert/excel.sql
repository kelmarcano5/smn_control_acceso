INSERT INTO smn_control_acceso.smn_carnet_identificacion
(
	smn_carnet_identificacion_id,
	cid_codigo,
	cid_descripcion,
	cid_estatus,
	cid_fecha_vigente,
	cid_fecha_registro
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_carnet_identificacion},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
