select	
	smn_control_acceso.smn_solicitud_permisos.smn_personal_id,
	smn_control_acceso.smn_solicitud_permisos.spe_detalles,
	smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_desde,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_hasta,
	smn_control_acceso.smn_solicitud_permisos.spe_nro_horas,
	smn_control_acceso.smn_solicitud_permisos.spe_aprobado_por,
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id

from 
	smn_control_acceso.smn_solicitud_permisos
where 
	smn_solicitud_permisos_id = ${fld:id}


