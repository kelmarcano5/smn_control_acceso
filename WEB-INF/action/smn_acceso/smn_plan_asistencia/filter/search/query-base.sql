select
	smn_plan_asistencia.cpa_fecha_vigencia,
	smn_plan_asistencia.cpa_idioma,
	smn_plan_asistencia.cpa_usuario,
	smn_plan_asistencia.cpa_fecha_registro,
	smn_plan_asistencia.cpa_hora,
	smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta as smn_empresa_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_plan_asistencia.cpa_fecha_desde_cal,
	smn_plan_asistencia.cpa_fecha_hasta_cal,
	smn_plan_asistencia.cpa_fecha_generado,
	smn_plan_asistencia.smn_esquema_rotacion_id,
	smn_plan_asistencia.cpa_ano,
	smn_plan_asistencia.cpa_num_semana_ini,
	smn_plan_asistencia.cpa_num_semana_fin,
	smn_plan_asistencia.cpa_status,
	smn_plan_asistencia.smn_plan_asistencia_id
	
from
	smn_control_acceso.smn_plan_asistencia
		INNER JOIN smn_base.smn_entidades ON (smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_plan_asistencia.smn_empresa_rf)
		INNER JOIN smn_base.smn_sucursales ON (smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_plan_asistencia.smn_sucursal_rf)
		INNER JOIN smn_base.smn_estructura_organizacional ON (smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_plan_asistencia.smn_estructura_organizacional_rf)

where
	smn_plan_asistencia_id is not null
	${filter}
order by
		smn_plan_asistencia_id
