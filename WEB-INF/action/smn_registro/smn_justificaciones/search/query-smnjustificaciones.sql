select distinct
	smn_gip.smn_documentos.smn_documentos_generales_rf as dcm_nombre,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_gip.smn_tipo_actividades.tya_nombre,
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id,
	case
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='AP' then '${lbl:b_approved}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='RZ' then '${lbl:b_not_approved}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='PEN' then '${lbl:b_pending}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='GE' then 'Generada'
	end as jus_estatus_rf,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion smn_personal_id,
	smn_base.smn_auxiliar.aux_nombres,
	smn_base.smn_auxiliar.aux_apellidos,
	smn_control_acceso.smn_justificaciones.smn_personal_id as smn_personal_id2,
	smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf,
	smn_control_acceso.smn_justificaciones.jus_documento_rf,
	smn_control_acceso.smn_justificaciones.jus_fecha_incidencia,
	smn_control_acceso.smn_justificaciones.jus_hora_incidencia,
	smn_control_acceso.smn_justificaciones.jus_tiempo_a_justificar,
	smn_control_acceso.smn_justificaciones.jus_fecha_registro,
	case
		when smn_gip.smn_categoria_justificaciones.cju_requiere_anexo_rf='S' then 'Si'
				when smn_gip.smn_categoria_justificaciones.cju_requiere_anexo_rf='N' then 'No'
	end as anexo,
	case
		when smn_control_acceso.smn_justificaciones.jus_causa='IH' then 'Incidencia en Hogar'
		when smn_control_acceso.smn_justificaciones.jus_causa='IT' then 'Incidencia en Transporte'
		when smn_control_acceso.smn_justificaciones.jus_causa='IS' then 'Incidencia Salud'
		when smn_control_acceso.smn_justificaciones.jus_causa='IF' then 'Incidencia con Familiar'
		when smn_control_acceso.smn_justificaciones.jus_causa='IV' then 'Incidencia Vehiculo'
		when smn_control_acceso.smn_justificaciones.jus_causa='AE' then 'Actividades Empresa'
	end as jus_causa,
	smn_gip.smn_categoria_justificaciones.cju_nombre as categoria
from
	smn_control_acceso.smn_justificaciones
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_justificaciones.jus_documento_rf
	left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_justificaciones.smn_personal_id
	left outer join smn_gip.smn_tipo_actividades on smn_gip.smn_tipo_actividades.smn_tipo_actividades_id = smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf
	left join smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_justificaciones.smn_categoria_justificacion_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where
	smn_control_acceso.smn_justificaciones.jus_estatus_rf IN ('PEN', 'GE') and smn_seguridad.s_user.userlogin='${def:user}'
order by smn_control_acceso.smn_justificaciones.jus_fecha_incidencia asc
--where
 --	 order by jus_fecha_registro asc


