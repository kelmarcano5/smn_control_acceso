select	
	smn_control_acceso.smn_justificaciones_soporte.smn_justificaciones_id,
	smn_control_acceso.smn_justificaciones_soporte.smn_personal_rf,
	smn_control_acceso.smn_justificaciones_soporte.jsa_description,
	smn_control_acceso.smn_justificaciones_soporte.smn_justificaciones_soporte_id

from 
	smn_control_acceso.smn_justificaciones_soporte
where 
	smn_justificaciones_soporte_id = ${fld:id}


