UPDATE smn_control_acceso.smn_permisos_soporte SET
	smn_solicitud_permisos_id=${fld:smn_solicitud_permisos_id},
	pma_persona_ref=${fld:pma_persona_ref},
	pma_archivo=${fld:_filename},
	pma_datos_imagen=?,
	pma_tamano=${fld:_filesize},
	pma_archivo=${fld:_filenametemp},
	pma_contenido=${fld:_contenttype},
	pma_idioma='${def:locale}',
	pma_usuario='${def:user}',
	pma_fecha_registro={d '${def:date}'},
	pma_hora='${def:time}'

WHERE
	smn_permisos_soporte_id=${fld:id}

