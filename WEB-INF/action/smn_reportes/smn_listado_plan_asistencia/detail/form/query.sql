select DISTINCT
	smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos as asi_personal_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_evento as fecha,
	CASE
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='ENT' THEN 'Entrada'
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='SAL'	then 'Salida'
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='CO'	then 'Indefinido'
	end as tipo_movimiento,
	smn_control_acceso.smn_asistencia.asi_hora_tope_evento as hora_tope_evento,
	smn_control_acceso.smn_asistencia.asi_hora_marcaje as hora_marcaje,
	smn_gip.smn_categoria_justificaciones.cju_nombre as smn_categoria_justificacion_rf,
	smn_control_acceso.smn_justificaciones.jus_descripcion as justificacion, 
	smn_control_acceso.smn_asistencia.smn_asistencia_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_empresa_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_control_acceso.smn_asistencia.smn_plan_asistencia_id,
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_registro,
	smn_base.smn_auxiliar.aux_num_doc_oficial as cedula
from
	smn_control_acceso.smn_asistencia
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf
	left join smn_base.smn_sucursales ON smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf
	left join smn_base.smn_estructura_organizacional ON smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	left join smn_control_acceso.smn_solicitud_permisos on smn_control_acceso.smn_solicitud_permisos.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
	left join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_solicitud_permisos.spe_documento_rf
	left join smn_control_acceso.smn_justificaciones on smn_control_acceso.smn_justificaciones.smn_plan_asistencia_id = smn_control_acceso.smn_asistencia.smn_plan_asistencia_id
	left join smn_control_acceso.smn_asistencia_comedor on smn_control_acceso.smn_asistencia_comedor.smn_asistencia_id = smn_control_acceso.smn_asistencia.smn_asistencia_id
	left join smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_justificaciones.smn_categoria_justificacion_id 
where
	smn_control_acceso.smn_asistencia.smn_asistencia_id = ${fld:id}
