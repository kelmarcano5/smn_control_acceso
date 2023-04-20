UPDATE smn_control_acceso.smn_visitantes SET
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_estructura_organizativa_rf=${fld:smn_estructura_organizativa_rf},
	smn_tipo_documento_identidad_rf=${fld:smn_tipo_documento_identidad_rf},
	vis_documento_identidad=${fld:vis_documento_identidad},
	vis_nombre=${fld:vis_nombre},
	vis_apellido=${fld:vis_apellido},
	vis_empresa=${fld:vis_empresa},
	smn_numero_carnet_asignado_id=${fld:smn_numero_carnet_asignado_id},
	vis_hora_entrada=${fld:vis_hora_entrada},
	vis_hora_estimada_salida=${fld:vis_hora_estimada_salida},
	vis_invitado_almuerzo=${fld:vis_invitado_almuerzo},
	vis_estatus=${fld:vis_estatus},
	smn_personal_id=${fld:smn_personal_id},
	vis_fecha_vigencia=${fld:vis_fecha_vigencia},
	vis_idioma='${def:locale}',
	vis_usuario='${def:user}',
	vis_fecha_registro={d '${def:date}'},
	vis_hora='${def:time}',
	smn_codigo_variable_1=${fld:smn_codigo_variable_1},
	smn_valor_variable_1=${fld:smn_valor_variable_1},
	smn_codigo_variable_2=${fld:smn_codigo_variable_2},
	smn_valor_variable_2=${fld:smn_valor_variable_2}

WHERE
	smn_visitantes_id=${fld:id}

