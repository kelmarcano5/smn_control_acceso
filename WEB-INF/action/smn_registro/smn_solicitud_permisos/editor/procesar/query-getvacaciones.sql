select 
  smn_control_vacaciones_id,
  cva_cantidad_dias_pendientes
  
from smn_expedientes.smn_control_vacaciones
where cva_estatus_proceso = 'PE' and smn_personal_id=${fld:smn_personal_id}
and cva_cantidad_dias_pendientes > 0
and cva_fecha_vigencia <= {d '${def:date}'}
order by cva_periodo_desde