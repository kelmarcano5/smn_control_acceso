select	
	smn_control_acceso.smn_imagen_personal.smn_personal_id,
	smn_control_acceso.smn_imagen_personal.imp_descripcion,
	smn_control_acceso.smn_imagen_personal.smn_imagen_personal_id

from 
	smn_control_acceso.smn_imagen_personal
where 
	smn_imagen_personal_id = ${fld:id}


