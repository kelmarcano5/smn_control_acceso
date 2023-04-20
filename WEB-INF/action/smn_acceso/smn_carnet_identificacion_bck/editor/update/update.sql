UPDATE smn_control_acceso.smn_carnet_identificacion SET
	cid_codigo=${fld:cid_codigo},
	cid_descripcion=${fld:cid_descripcion},
	cid_estatus=${fld:cid_estatus},
	cid_fecha_vigente={d '${def:date}'},
	cid_idioma='${def:locale}',
	cid_usuario='${def:user}',
	cid_fecha_registro={d '${def:date}'},
	cid_hora='${def:time}'

WHERE
	smn_carnet_identificacion_id=${fld:id}

