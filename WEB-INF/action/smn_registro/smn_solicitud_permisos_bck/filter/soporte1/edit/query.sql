select	
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id, 
	smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf as spe_estatus_rf_pl0,
	smn_control_acceso.smn_permisos_soporte.pma_persona_ref,
	smn_control_acceso.smn_permisos_soporte.smn_permisos_soporte_id

from
	smn_control_acceso.smn_solicitud_permisos,
	smn_control_acceso.smn_permisos_soporte 
where
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id=smn_control_acceso.smn_permisos_soporte.smn_solicitud_permisos_id and
	smn_permisos_soporte_id = ${fld:id} 
	


