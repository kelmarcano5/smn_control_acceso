INSERT INTO smn_control_acceso.smn_imagen_personal
(
	smn_imagen_personal_id,
	smn_personal_id,
	imp_descripcion,
	filename,
	cca_imagen_size,
	filenametemp,
	content_type
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_imagen_personal},
	${fld:smn_personal_id},
	${fld:imp_descripcion},
	${fld:_filename},
	${fld:_filesize},
	${fld:_filenametemp},
	${fld:_contenttype}
)
