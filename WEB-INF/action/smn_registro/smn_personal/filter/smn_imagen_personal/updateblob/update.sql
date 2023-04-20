UPDATE smn_control_acceso.smn_imagen_personal SET
	smn_personal_id=${fld:smn_personal_id},
	imp_descripcion=${fld:imp_descripcion},
	filename=${fld:_filename},
	cca_imagen_size=${fld:_filesize},
	filenametemp=${fld:_filenametemp},
	content_type=${fld:_contenttype}

WHERE
	smn_imagen_personal_id=${fld:id}

