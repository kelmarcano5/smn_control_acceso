select
	smn_gip.smn_categoria_justificaciones.cju_nombre,
	smn_gip.smn_documentos.dcm_nombre,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	${field}
from
	smn_gip.smn_categoria_justificaciones,
	smn_gip.smn_documentos,
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_solicitud_permisos
where
	smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf and
	smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_solicitud_permisos.spe_documento_rf and
	smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf and
		smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id = ${fld:id}
	
