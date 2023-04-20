SELECT 
	smn_base.smn_estructura_organizacional.eor_codigo ||' - '|| smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as auxiliar,
	smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_desde_cal,
	smn_control_acceso.smn_plan_asistencia.cpa_fecha_hasta_cal,
	case
		when smn_control_acceso.smn_plan_asistencia.cpa_status = 'GE' then 'Generado'
		when smn_control_acceso.smn_plan_asistencia.cpa_status = 'AP' then 'Aprobado'
	end as cpa_status,
	personal.aux_descripcion as personal,
	smn_base.smn_auxiliar.aux_num_doc_oficial as cedula
FROM
	smn_base.smn_estructura_organizacional
	INNER JOIN smn_control_acceso.smn_plan_asistencia ON smn_control_acceso.smn_plan_asistencia.smn_estructura_organizacional_rf = smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
	INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_estructura_organizacional.eor_aprobador = smn_base.smn_auxiliar.smn_auxiliar_id
	INNER JOIN smn_control_acceso.smn_asistencia ON smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id = smn_control_acceso.smn_asistencia.smn_plan_asistencia_id
	INNER JOIN smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
	INNER JOIN smn_base.smn_auxiliar personal ON personal.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
where
	smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id is not null and smn_control_acceso.smn_asistencia.asi_secuencia_tipo_marcaje = 1
	${filter}
ORDER BY
	smn_base.smn_estructura_organizacional.eor_codigo ASC,
	smn_base.smn_estructura_organizacional.eor_nombre ASC,
	smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id ASC,
	smn_control_acceso.smn_asistencia.asi_personal_rf ASC
