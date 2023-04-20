UPDATE smn_control_acceso.smn_movimiento_marcajes SET
	mrk_auxiliar=${fld:mrk_auxiliar},
	mrk_clase_auxiliar=${fld:mrk_clase_auxiliar},
	mrk_control_acceso_id=${fld:mrk_control_acceso_id},
	mrk_empresa=${fld:mrk_empresa},
	mrk_sucursal=${fld:mrk_sucursal},
	mrk_area_servicio=${fld:mrk_area_servicio},
	mrk_unidad_servicio=${fld:mrk_unidad_servicio},
	mrk_centro_costo=${fld:mrk_centro_costo},
	mrk_cargo=${fld:mrk_cargo},
	mrk_categoria_cargo=${fld:mrk_categoria_cargo},
	mrk_marcaje_id=${fld:mrk_marcaje_id},
	mrk_dispositivo_codigo=${fld:mrk_dispositivo_codigo},
	mrk_marcaje_fecha=${fld:mrk_marcaje_fecha},
	mrk_marcaje_hora=${fld:mrk_marcaje_hora},
	mrk_marcaje_dia=${fld:mrk_marcaje_dia},
	mrk_marcaje_tipo=${fld:mrk_marcaje_tipo},
	mrk_tiempo_efectivo=${fld:mrk_tiempo_efectivo},
	mrk_turno=${fld:mrk_turno},
	mrk_consecutivo=${fld:mrk_consecutivo},
	mrk_idioma='${def:locale}',
	mrk_usuario='${def:user}',
	mrk_fecha_registro={d '${def:date}'},
	mrk_hora='${def:time}'

WHERE
	smn_movimiento_marcajes_id=${fld:id}

