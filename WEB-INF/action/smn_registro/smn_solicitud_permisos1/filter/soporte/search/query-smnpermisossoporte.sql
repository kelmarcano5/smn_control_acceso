select
	(select smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos from   smn_control_acceso.smn_personal left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_permisos_soporte.smn_persona_rf) as smn_persona_rf_combo,
	smn_control_acceso.smn_permisos_soporte.smn_permisos_soporte_id,
	smn_control_acceso.smn_permisos_soporte.smn_solicitud_permisos_id,
	smn_control_acceso.smn_permisos_soporte.smn_persona_rf,
	smn_control_acceso.smn_permisos_soporte.pma_description,
	smn_control_acceso.smn_permisos_soporte.pma_imagen_size,
	smn_control_acceso.smn_permisos_soporte.filename,
	smn_control_acceso.smn_permisos_soporte.content_type,
	smn_control_acceso.smn_permisos_soporte.pma_idioma,
	smn_control_acceso.smn_permisos_soporte.pma_usuario,
	smn_control_acceso.smn_permisos_soporte.pma_fecha_registro,
	smn_control_acceso.smn_permisos_soporte.pma_hora

from 
	smn_control_acceso.smn_permisos_soporte
where
	smn_control_acceso.smn_permisos_soporte.smn_solicitud_permisos_id='${fld:id_p}'
order by 
	smn_permisos_soporte_id
