select
	smn_control_acceso.smn_control_plan_asistencia.smn_control_plan_asistencia_id,
	case
	when smn_control_acceso.smn_control_plan_asistencia.cpa_status='RE' then '${lbl:b_registry}'
	when smn_control_acceso.smn_control_plan_asistencia.cpa_status='GE' then '${lbl:b_generate}'
	end as cpa_status,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_empresa_rf,
	smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_codigo ||''|| smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos as smn_personal_id,
	smn_control_acceso.smn_control_plan_asistencia.cpa_ano,
	smn_control_acceso.smn_control_plan_asistencia.cpa_fecha_registro
from
	smn_control_acceso.smn_control_plan_asistencia
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_control_plan_asistencia.smn_empresa_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_control_plan_asistencia.smn_sucursal_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_control_plan_asistencia.smn_estructura_organizacional_rf
	left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_control_plan_asistencia.smn_personal_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.smn_personal_id