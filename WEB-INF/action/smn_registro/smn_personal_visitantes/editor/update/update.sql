UPDATE smn_control_acceso.smn_personal_visitantes SET
	smn_personal_id=${fld:smn_personal_id},
	smn_entidad_rf=${fld:smn_entidades_id},
	smn_sucursal_rf=${fld:smn_sucursales_id},
	smn_estructura_organizacional_rf=${fld:smn_estructura_organizacional_id},
	smn_cedula_rf=${fld:smn_cedula_rf},
	rpv_fecha_evento=${fld:rpv_fecha_evento},
	rpv_razon_visita=${fld:rpv_razon_visita},
	rpv_autorizado_almorzar=${fld:rpv_autorizado_almorzar},
	rpv_autorizador=(SELECT smn_base.smn_auxiliar.smn_auxiliar_id FROM smn_base.smn_auxiliar
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
	inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf where
	smn_seguridad.s_user.userlogin='${def:user}'),
	rpv_estatus=${fld:rpv_estatus},
	rpv_idioma='${def:locale}',
	rpv_usuario='${def:user}',
	rpv_fecha_registro={d '${def:date}'},
	rpv_hora='${def:time}'

WHERE
	smn_personal_visitantes_id=${fld:id}

