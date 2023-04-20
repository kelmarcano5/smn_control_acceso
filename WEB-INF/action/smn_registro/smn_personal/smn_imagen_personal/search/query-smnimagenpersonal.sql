select	
	smn_control_acceso.smn_personal.smn_personal_id, 
	smn_base.smn_auxiliar.aux_descripcion as smn_personal_id_combo,
	smn_control_acceso.smn_imagen_personal.smn_imagen_personal_id,
	smn_control_acceso.smn_imagen_personal.imp_descripcion,
	smn_control_acceso.smn_imagen_personal.cca_imagen_size,
	smn_control_acceso.smn_imagen_personal.filename,
	smn_control_acceso.smn_imagen_personal.content_type,
	smn_control_acceso.smn_imagen_personal.filenametemp

from
	smn_control_acceso.smn_imagen_personal 
	left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_imagen_personal.smn_personal_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf 
where
	smn_control_acceso.smn_imagen_personal.smn_personal_id=${fld:id2}

order by 
	smn_imagen_personal_id
