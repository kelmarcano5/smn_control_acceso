select
	smn_gip.smn_documentos.smn_documentos_generales_rf as dcm_nombre,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_gip.smn_tipo_actividades.tya_nombre,
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id,
	case
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='APR' then '${lbl:b_approved}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='NAP' then '${lbl:b_not_approved}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='PEN' then '${lbl:b_pending}'
	end as jus_estatus_rf,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion smn_personal_id,
	smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf,
	smn_control_acceso.smn_justificaciones.jus_fecha_incidencia,
	smn_control_acceso.smn_justificaciones.jus_hora_incidencia,
	smn_control_acceso.smn_justificaciones.jus_tiempo_a_justificar,
		smn_control_acceso.smn_justificaciones.jus_descripcion,
	smn_control_acceso.smn_justificaciones.jus_causa,
	smn_control_acceso.smn_justificaciones.jus_estatus_rf,
	smn_base.smn_v_jefe_directo.codigo ||' - '|| smn_base.smn_v_jefe_directo.descripcion as jus_jefe_inmediato_rf,
	smn_control_acceso.smn_justificaciones.jus_fecha_registro
from
	smn_control_acceso.smn_justificaciones
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_justificaciones.jus_documento_rf
	left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_justificaciones.smn_personal_id
	left outer join smn_gip.smn_tipo_actividades on smn_gip.smn_tipo_actividades.smn_tipo_actividades_id = smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	left outer join smn_base.smn_v_jefe_directo on smn_base.smn_v_jefe_directo.aprobador_id = smn_control_acceso.smn_justificaciones.jus_jefe_inmediato_rf
where
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id=${fld:id}	




