select 
  cva_periodo_desde,
  cva_periodo_hasta,
  cva_cantidad_dias_pendientes
  
  
from smn_expedientes.smn_control_vacaciones
where cva_estatus_proceso = 'PE' and smn_personal_id=${fld:id}
and cva_cantidad_dias_pendientes > 0
and cva_fecha_vigencia <= {d '${def:date}'}
order by cva_periodo_desde
  