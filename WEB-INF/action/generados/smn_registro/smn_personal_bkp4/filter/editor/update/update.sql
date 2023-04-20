UPDATE smn_control_acceso.smn_personal SET
	psl_num_control=${fld:psl_num_control},
	psl_grupo=${fld:psl_grupo},
	psl_grupo_fecha_inicio=${fld:psl_grupo_fecha_inicio},
	psl_clase_auxiliar=${fld:psl_clase_auxiliar},
	psl_auxiliar=${fld:psl_auxiliar},
	psl_empresa=${fld:psl_empresa},
	psl_sucursal=${fld:psl_sucursal},
	psl_area_servicio=${fld:psl_area_servicio},
	psl_unidad_servicio=${fld:psl_unidad_servicio},
	psl_centro_costo=${fld:psl_centro_costo},
	psl_estructura_organiz=${fld:psl_estructura_organiz},
	psl_cargo=${fld:psl_cargo},
	psl_categoria_cargo=${fld:psl_categoria_cargo},
	psl_habilita_acceso=${fld:psl_habilita_acceso},
	psl_id_control_acceso=${fld:psl_id_control_acceso},
	psl_idioma='${def:locale}',
	psl_usuario='${def:user}',
	psl_fecha_registro={d '${def:date}'},
	psl_hora='${def:time}'

WHERE
	smn_personal_id=${fld:id}

