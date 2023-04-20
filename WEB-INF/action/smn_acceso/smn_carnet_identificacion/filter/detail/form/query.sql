select
		smn_control_acceso.smn_carnet_identificacion.smn_carnet_identificacion_id,
	smn_control_acceso.smn_carnet_identificacion.cid_codigo,
	smn_control_acceso.smn_carnet_identificacion.cid_descripcion,
	CASE
		WHEN smn_control_acceso.smn_carnet_identificacion.cid_estatus='DI' THEN '${lbl:b_available}'
		WHEN smn_control_acceso.smn_carnet_identificacion.cid_estatus='OC' THEN '${lbl:b_occupied}'
		WHEN smn_control_acceso.smn_carnet_identificacion.cid_estatus='AN' THEN '${lbl:b_anulated}'
	END AS cid_estatus,
	smn_control_acceso.smn_carnet_identificacion.cid_fecha_vigente,
	smn_control_acceso.smn_carnet_identificacion.cid_fecha_registro
	
from
	smn_control_acceso.smn_carnet_identificacion

where
	smn_carnet_identificacion_id = ${fld:id}
