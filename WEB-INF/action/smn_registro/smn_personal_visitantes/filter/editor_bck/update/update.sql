UPDATE smn_control_acceso.smn_personal_visitantes SET
	smn_personal_id=${fld:smn_personal_id},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_estructura_organizacional_rf=${fld:smn_estructura_organizacional_rf},
	smn_cedula_rf=${fld:smn_cedula_rf},
	rpv_fecha_evento=${fld:rpv_fecha_evento},
	rpv_razon_visita=${fld:rpv_razon_visita},
	rpv_autorizado_almorzar=${fld:rpv_autorizado_almorzar},
	rpv_autorizador=${fld:rpv_autorizador},
	rpv_estatus=${fld:rpv_estatus},
	rpv_fecha_registro=${fld:rpv_fecha_registro}

WHERE
	smn_personal_visitantes_id=${fld:id}
