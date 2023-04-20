with rows as  (
	select DISTINCT
		smn_control_acceso.smn_asistencia.smn_asistencia_id,
		smn_base.smn_entidades.ent_descripcion_corta AS smn_empresa_rf,
		smn_base.smn_sucursales.suc_nombre AS smn_sucursal_rf,
		smn_base.smn_estructura_organizacional.eor_nombre AS smn_estructura_organizacional_rf,
		smn_base.smn_auxiliar.aux_nombres || ' - ' || smn_base.smn_auxiliar.aux_apellidos AS asi_personal_rf,
		smn_control_acceso.smn_asistencia.asi_dia_evento,
		smn_control_acceso.smn_asistencia.asi_fecha_evento AS fecha,
		CASE
				WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje ='ENT' THEN
				'Entrada' 
				WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje = 'SAL' THEN
				'Salida' 
				WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje = 'CO' THEN
				'Indefinido' 
		END AS tipo_movimiento,
		CASE
				WHEN smn_control_acceso.smn_asistencia.asi_hora_marcaje IS NULL THEN
				'00:00' 
				WHEN smn_control_acceso.smn_asistencia.asi_hora_marcaje IS NOT NULL THEN
				asi_hora_marcaje 
		END AS hora,
		CASE
				WHEN smn_control_acceso.smn_asistencia.asi_estatus_marcaje IS NULL THEN
				'No asistio' 
				WHEN smn_control_acceso.smn_asistencia.asi_estatus_marcaje = 'A' THEN
				'Asistio' 
				WHEN smn_control_acceso.smn_asistencia.asi_estatus_marcaje = 'NA' THEN
				'No asistio' 
		END AS estatus,
		CASE
				WHEN smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf = 'S' THEN 'SI'
				WHEN smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf = 'N' THEN 'NO' 
		END AS reposo,
		smn_control_acceso.smn_asistencia.asi_personal_rf as personal_id,
		smn_control_acceso.smn_asistencia.asi_fecha_registro,
		smn_base.smn_entidades.smn_entidades_id as empresa_id,
		smn_base.smn_sucursales.smn_sucursales_id as sucursal_id,
		smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as organizacional_id,
		smn_control_acceso.smn_asistencia.asi_tipo_marcaje as tipo,
		smn_control_acceso.smn_asistencia.asi_secuencia_tipo_marcaje as secuencia,
		smn_control_acceso.smn_asistencia.asi_hora_tope_evento AS hora_tope_evento,
		smn_control_acceso.smn_asistencia.asi_hora_marcaje AS hora_marcaje,
		smn_control_acceso.smn_asistencia.smn_plan_asistencia_id,
		smn_base.smn_auxiliar.aux_num_doc_oficial as cedula
				
		FROM
			smn_control_acceso.smn_asistencia
			left JOIN smn_control_acceso.smn_personal ON smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
			INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
			INNER JOIN smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf
			LEFT JOIN smn_base.smn_sucursales ON smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf
			LEFT JOIN smn_base.smn_estructura_organizacional ON smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
		where smn_control_acceso.smn_asistencia.asi_fecha_evento BETWEEN ${fld:asi_fecha_registro_ini} AND ${fld:asi_fecha_registro_fin}
)
select rows.asi_personal_rf, rows.empresa_id, rows.sucursal_id, rows.organizacional_id, rows.fecha, rows.tipo_movimiento,  
rows.estatus, rows.hora_tope_evento, rows.hora_marcaje, rows.reposo, smn_gip.smn_categoria_justificaciones.cju_nombre as categoria, 
smn_control_acceso.smn_justificaciones.jus_descripcion as justificacion, 
case
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='AP' then '${lbl:b_approved}'
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='RZ' then '${lbl:b_not_approved}'
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='PE' then '${lbl:b_pending}'
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='GE' then 'Generada'
end as estatus_jus,
rows.asi_fecha_registro, rows.cedula
from rows
left JOIN smn_control_acceso.smn_solicitud_permisos ON smn_control_acceso.smn_solicitud_permisos.smn_personal_id = rows.personal_id and smn_control_acceso.smn_solicitud_permisos.spe_fecha_desde < ${fld:asi_fecha_registro_ini} and smn_control_acceso.smn_solicitud_permisos.spe_fecha_hasta > ${fld:asi_fecha_registro_ini}
left JOIN smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf 
left join smn_control_acceso.smn_justificaciones on smn_control_acceso.smn_justificaciones.smn_personal_id = rows.personal_id 
and smn_control_acceso.smn_justificaciones.jus_fecha_incidencia =rows.fecha 
and smn_control_acceso.smn_justificaciones.jus_hora_incidencia = rows.hora_tope_evento
where rows.fecha BETWEEN ${fld:asi_fecha_registro_ini} AND ${fld:asi_fecha_registro_fin} $
${filter}
order by rows.personal_id, rows.fecha, rows.hora_tope_evento 