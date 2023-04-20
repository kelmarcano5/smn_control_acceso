select smn_control_acceso.smn_visitantes.vis_nombre as nombre, smn_control_acceso.smn_visitantes.vis_apellido as apellido, smn_control_acceso.smn_visitantes.vis_empresa as empresa from smn_control_acceso.smn_visitantes
where 
	smn_control_acceso.smn_visitantes.vis_documento_identidad=${fld:cedula}