update smn_expedientes.smn_control_vacaciones
	set cva_cantidad_dias_pendientes=cva_cantidad_dias_pendientes-${fld:spe_cantidad_dias},
	cva_fecha_solicitud=${fld:spe_fecha_desde}
  
where smn_control_vacaciones_id=${fld:smn_control_vacaciones}