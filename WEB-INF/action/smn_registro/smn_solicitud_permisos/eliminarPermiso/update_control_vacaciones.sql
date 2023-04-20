update smn_expedientes.smn_control_vacaciones
	set cva_cantidad_dias_pendientes=cva_cantidad_dias_pendientes+${fld:spe_cantidad_dias},
	cva_fecha_solicitud=null
  
where smn_control_vacaciones_id=${fld:smn_control_vacaciones}