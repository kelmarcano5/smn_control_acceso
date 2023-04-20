select
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id,
	smn_base.smn_auxiliar.aux_nombres||' - '|| smn_base.smn_auxiliar.aux_apellidos as smn_personal_id,
	smn_gip.smn_categoria_justificaciones.cju_codigo||' - '||cju_nombre as spe_categoria_justif_rf,
	smn_gip.smn_documentos.dcm_codigo||' - '||dcm_descripcion as spe_documento_rf,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf,
	${field}
from
	smn_control_acceso.smn_solicitud_permisos
	inner join smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_solicitud_permisos.spe_documento_rf
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_solicitud_permisos.smn_personal_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf
where
	smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf and
	smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_solicitud_permisos.spe_documento_rf and
	smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf and
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id is not null
	${filter}