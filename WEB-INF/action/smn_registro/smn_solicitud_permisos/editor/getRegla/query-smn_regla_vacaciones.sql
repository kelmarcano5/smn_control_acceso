select 
  rva_vacaciones_fraccionadas
  
from smn_control_acceso.smn_personal
left outer join smn_gip.smn_regla_vacaciones on smn_gip.smn_regla_vacaciones.smn_entidad_rf=smn_control_acceso.smn_personal.psl_empresa_rf and
smn_gip.smn_regla_vacaciones.smn_sucursal_rf=smn_control_acceso.smn_personal.psl_sucursal_rf

where rva_estatus = 'AC' and smn_personal_id=${fld:id}

  