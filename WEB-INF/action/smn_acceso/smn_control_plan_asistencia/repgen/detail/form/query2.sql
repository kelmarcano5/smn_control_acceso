select
		smn_control_acceso.smn_control_plan_asistencia.smn_empresa_rf,
	smn_control_acceso.smn_control_plan_asistencia.smn_sucursal_rf,
	smn_control_acceso.smn_control_plan_asistencia.smn_estructura_organizacional_rf,
	smn_control_acceso.smn_control_plan_asistencia.smn_personal_id,
	smn_control_acceso.smn_control_plan_asistencia.cpa_ano,
	smn_control_acceso.smn_control_plan_asistencia.cpa_num_semana_ini_id,
	smn_control_acceso.smn_control_plan_asistencia.cpa_num_semana_fin_id,
	smn_control_acceso.smn_control_plan_asistencia.cpa_fecha_desde_calc,
	smn_control_acceso.smn_control_plan_asistencia.cpa_fecha_hasta_calc,
	smn_control_acceso.smn_control_plan_asistencia.cpa_fecha_generado,
	smn_control_acceso.smn_control_plan_asistencia.cpa_status,
	smn_control_acceso.smn_control_plan_asistencia.cpa_fecha_vigencia,
	smn_control_acceso.smn_control_plan_asistencia.cpa_fecha_registro
from
	smn_control_acceso.smn_control_plan_asistencia 
where
	smn_control_acceso.smn_control_plan_asistencia.smn_control_plan_asistencia_id = ${fld:id}
