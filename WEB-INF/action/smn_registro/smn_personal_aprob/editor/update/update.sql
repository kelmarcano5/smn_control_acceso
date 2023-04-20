UPDATE smn_control_acceso.smn_personal SET
	psl_num_control=${fld:psl_num_control},
	psl_esquema_rotacion_rf=${fld:psl_esquema_rotacion_rf},
	psl_fecha_inicio_calculo=${fld:psl_fecha_inicio_calculo},
	psl_categoria_personal_rf=${fld:psl_categoria_personal_rf},
	psl_clase_auxiliar_rf=${fld:psl_clase_auxiliar_rf},
	psl_auxiliar_rf=${fld:psl_auxiliar_rf},
	psl_empresa_rf=${fld:psl_empresa_rf},
	psl_sucursal_rf=${fld:psl_sucursal_rf},
	psl_area_servicio_rf=${fld:psl_area_servicio_rf},
	psl_unidad_servicio_rf=${fld:psl_unidad_servicio_rf},
	psl_centro_costo_rf=${fld:psl_centro_costo_rf},
	psl_estructura_organizacional_rf=${fld:psl_estructura_organizacional_rf},
	psl_cargo_rf=${fld:psl_cargo_rf},
	psl_categoria_cargo_rf=${fld:psl_categoria_cargo_rf},
	psl_habilita_acceso_rf=${fld:psl_habilita_acceso_rf},
	psl_id_control_acceso=${fld:psl_id_control_acceso},
	psl_idioma='${def:locale}',
	psl_usuario='${def:user}',
	psl_fecha_registro={d '${def:date}'},
	psl_hora='${def:time}'

WHERE
	smn_personal_id=${fld:id}

