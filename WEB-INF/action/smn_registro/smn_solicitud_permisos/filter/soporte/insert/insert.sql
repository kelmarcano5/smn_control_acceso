INSERT INTO smn_control_acceso.smn_permisos_soporte
(
	smn_permisos_soporte_id,
	smn_solicitud_permisos_id,
	smn_persona_rf,
	pma_description,
	pma_imagen_data,
	filename,
	pma_imagen_size,
	content_type,
	pma_idioma,
	pma_usuario,
	pma_fecha_registro,
	pma_hora
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_permisos_soporte},
	${fld:smn_solicitud_permisos_id},
	${fld:smn_persona_rf},
	${fld:pma_description},
	?,
	${fld:_filename},
	${fld:_filesize},
	${fld:_contenttype},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
