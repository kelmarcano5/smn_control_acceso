UPDATE smn_dispositivos SET
	dis_codigo=${fld:dis_codigo},
	dis_nombre=${fld:dis_nombre},
	dis_empresa=${fld:dis_empresa},
	dis_sucursal=${fld:dis_sucursal},
	dis_area_servicio=${fld:dis_area_servicio},
	dis_unidad_servicio=${fld:dis_unidad_servicio},
	dis_tipo_dispositivo=${fld:dis_tipo_dispositivo},
	dis_serial=${fld:dis_serial},
	dis_ip_address=${fld:dis_ip_address},
	dis_idioma='${def:locale}',
	dis_usuario='${def:user}',
	dis_fecha_registro={d '${def:date}'},
	dis_hora='${def:time}'

WHERE
	smn_dispositivos_id=${fld:id}

