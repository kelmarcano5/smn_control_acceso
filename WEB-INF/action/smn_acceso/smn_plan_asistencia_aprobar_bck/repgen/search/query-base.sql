select
	${field},
	smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_vigencia,
	smn_control_acceso.smn_plan_asistencia.cpa_idioma,
	smn_control_acceso.smn_plan_asistencia.cpa_usuario,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_registro,
	smn_control_acceso.smn_plan_asistencia.cpa_hora,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_empresa_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_desde_cal,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_hasta_cal,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_generado,
	smn_gip.smn_esquema_rotacion.ero_codigo ||' - '|| smn_gip.smn_esquema_rotacion.ero_nombre as smn_esquema_rotacion_id,
	smn_control_acceso.smn_plan_asistencia.cpa_ano,
	smn_control_acceso.smn_plan_asistencia.cpa_num_semana_ini,
	smn_control_acceso.smn_plan_asistencia.cpa_num_semana_fin,
	case
		when smn_control_acceso.smn_plan_asistencia.cpa_status='RE' then '${lbl:b_register}'
		when smn_control_acceso.smn_plan_asistencia.cpa_status='AP' then '${lbl:b_aprobated}'
		when smn_control_acceso.smn_plan_asistencia.cpa_status='GE' then '${lbl:b_generated}'
	end as cpa_status,
	smn_control_acceso.smn_asistencia.smn_asistencia_id,
	smn_control_acceso.smn_asistencia.asi_id_control_acceso,
	case
		when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='N' then '${lbl:b_not}'
	end as asi_estatus_permiso_rf,
	case
		when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='AP' then '${lbl:b_aprobated}'
		when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='GE' then '${lbl:b_generated}'
		when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='NG' then '${lbl:b_not_generated}'
	end as asi_estatus_asistencia_rf,
	case
		when smn_control_acceso.smn_asistencia.asi_dia_evento='lu' then 'Lunes'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='ma' then 'Martes'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='mi' then 'Miercoles'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='ju' then 'Jueves'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='vi' then 'Viernes'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='sa' then 'Sabado'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='do' then 'Domingo'
	end as asi_dia_evento,
	CASE
		when smn_control_acceso.smn_asistencia.asi_tipo_marcaje='ENT' then 'Entrada'
		when smn_control_acceso.smn_asistencia.asi_tipo_marcaje='SAL' then 'Salida'
	end as asi_tipo_marcaje,
	case
		when smn_control_acceso.smn_asistencia.asi_estatus_marcaje='NA' then '${lbl:b_not_attended}'
		when smn_control_acceso.smn_asistencia.asi_estatus_marcaje='A' then '${lbl:b_attended}'
	end as asi_estatus_marcaje,
	smn_base.smn_auxiliar.aux_codigo||' - '|| smn_base.smn_auxiliar.aux_descripcion as asi_personal_rf,
	smn_gip.smn_turnos.tur_codigo ||' - '|| smn_gip.smn_turnos.tur_nombre as asi_turno_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_evento,
	smn_control_acceso.smn_asistencia.asi_hora_tope_evento,
	smn_control_acceso.smn_asistencia.asi_hora_marcaje,
	smn_control_acceso.smn_asistencia.asi_secuencia_tipo_marcaje,
	smn_control_acceso.smn_asistencia.asi_fecha_registro
from
	smn_control_acceso.smn_plan_asistencia
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_plan_asistencia.smn_empresa_rf
	inner join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_plan_asistencia.smn_sucursal_rf
	inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_plan_asistencia.smn_estructura_organizacional_rf
	inner join smn_gip.smn_esquema_rotacion on smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_plan_asistencia.smn_esquema_rotacion_id 
	left outer join smn_control_acceso.smn_asistencia on smn_control_acceso.smn_asistencia.smn_plan_asistencia_id = smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id
	left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_gip.smn_turnos on smn_gip.smn_turnos.smn_turnos_id = smn_control_acceso.smn_asistencia.asi_turno_rf
where
	smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id is not null
	${filter}