select	
	smn_control_acceso.smn_permisos_soporte.smn_solicitud_permisos_id,
	smn_control_acceso.smn_permisos_soporte.smn_persona_rf,
	smn_control_acceso.smn_permisos_soporte.pma_description,
	smn_control_acceso.smn_permisos_soporte.smn_permisos_soporte_id

from 
	smn_control_acceso.smn_permisos_soporte
where 
	smn_permisos_soporte_id = ${fld:id}


