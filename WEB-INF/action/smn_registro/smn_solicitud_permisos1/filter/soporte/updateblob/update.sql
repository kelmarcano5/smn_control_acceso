UPDATE smn_control_acceso.smn_permisos_soporte SET
	smn_solicitud_permisos_id=${fld:smn_solicitud_permisos_id},
	smn_persona_rf=${fld:smn_persona_rf},
	pma_description=${fld:pma_description},
	pma_imagen_data=?,
	filename=${fld:_filename},
	pma_imagen_size=${fld:_filesize},
	content_type=${fld:_contenttype},
	pma_idioma='${def:locale}',
	pma_usuario='${def:user}',
	pma_fecha_registro={d '${def:date}'},
	pma_hora='${def:time}'

WHERE
	smn_permisos_soporte_id=${fld:id}

