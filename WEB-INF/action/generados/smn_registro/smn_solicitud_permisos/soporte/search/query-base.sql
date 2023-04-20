select	
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id, 
	smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf as spe_estatus_rf_pl0,
	(select smn_control_acceso.smn_personal.psl_num_control || ' - ' || smn_control_acceso.smn_personal.psl_id_control_acceso from  smn_control_acceso.smn_personal  where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_permisos_soporte.pma_persona_ref  order by smn_control_acceso.smn_personal.psl_id_control_acceso ) as pma_persona_ref_combo,
	smn_control_acceso.smn_permisos_soporte.smn_permisos_soporte_id,
	smn_control_acceso.smn_permisos_soporte.pma_persona_ref,
	smn_control_acceso.smn_permisos_soporte.pma_archivo,
	smn_control_acceso.smn_permisos_soporte.pma_contenido,
	smn_control_acceso.smn_permisos_soporte.pma_tamano,
	smn_control_acceso.smn_permisos_soporte.pma_idioma,
	smn_control_acceso.smn_permisos_soporte.pma_usuario,
	smn_control_acceso.smn_permisos_soporte.pma_fecha_registro,
	smn_control_acceso.smn_permisos_soporte.pma_hora

from
	smn_control_acceso.smn_solicitud_permisos,
	smn_control_acceso.smn_permisos_soporte 
where
	smn_permisos_soporte_id is not null
and 	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id=smn_control_acceso.smn_permisos_soporte.smn_solicitud_permisos_id 

${filter}
order by 
	smn_permisos_soporte_id