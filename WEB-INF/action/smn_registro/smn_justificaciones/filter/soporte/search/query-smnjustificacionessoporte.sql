select
	(select smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos from   smn_control_acceso.smn_personal left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones_soporte.smn_personal_rf) as smn_personal_rf_combo,
	smn_control_acceso.smn_justificaciones_soporte.smn_justificaciones_soporte_id,
	smn_control_acceso.smn_justificaciones_soporte.smn_justificaciones_id,
	smn_control_acceso.smn_justificaciones_soporte.smn_personal_rf,
	smn_control_acceso.smn_justificaciones_soporte.jsa_description,
	smn_control_acceso.smn_justificaciones_soporte.jsa_imagen_size,
	smn_control_acceso.smn_justificaciones_soporte.filename,
	smn_control_acceso.smn_justificaciones_soporte.content_type,
	smn_control_acceso.smn_justificaciones_soporte.jsa_fecha_registro
from 
	smn_control_acceso.smn_justificaciones_soporte
where
	smn_control_acceso.smn_justificaciones_soporte.smn_justificaciones_id=${fld:id}
order by 
	smn_justificaciones_soporte_id
