select
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_vigencia,
	smn_control_acceso.smn_plan_asistencia.cpa_idioma,
	smn_control_acceso.smn_plan_asistencia.cpa_usuario,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_registro,
	smn_control_acceso.smn_plan_asistencia.cpa_hora,
	smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta as smn_empresa_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_desde_cal,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_hasta_cal,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_generado,
	smn_control_acceso.smn_plan_asistencia.smn_esquema_rotacion_id,
smn_gip.smn_esquema_rotacion.ero_codigo|| ' - ' ||smn_gip.smn_esquema_rotacion.ero_nombre as smn_esquema_rotacion_id2,
	smn_control_acceso.smn_plan_asistencia.cpa_ano,
	smn_control_acceso.smn_plan_asistencia.cpa_num_semana_ini,
	smn_control_acceso.smn_plan_asistencia.cpa_num_semana_fin,
	case
		when smn_control_acceso.smn_plan_asistencia.cpa_status='RE' then '${lbl:b_register}'
		when  smn_control_acceso.smn_plan_asistencia.cpa_status='AP' then '${lbl:b_aprobated}'
		when  smn_control_acceso.smn_plan_asistencia.cpa_status='GE' then '${lbl:b_generated}'
	end as cpa_status2,
	smn_control_acceso.smn_plan_asistencia.cpa_status,
	smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id
	
from
	smn_control_acceso.smn_plan_asistencia
	INNER JOIN smn_base.smn_entidades ON (smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_plan_asistencia.smn_empresa_rf)
	INNER JOIN smn_base.smn_sucursales ON (smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_plan_asistencia.smn_sucursal_rf)
	INNER JOIN smn_base.smn_estructura_organizacional ON (smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_plan_asistencia.smn_estructura_organizacional_rf)
INNER JOIN smn_gip.smn_esquema_rotacion ON smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_plan_asistencia.smn_esquema_rotacion_id 
order by
		smn_plan_asistencia_id
