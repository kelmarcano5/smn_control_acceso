UPDATE smn_control_acceso.smn_permisos_soporte SET
	smn_solicitud_permisos_id=${fld:smn_solicitud_permisos_id},
	smn_persona_rf=${fld:smn_persona_rf},
	pma_description=${fld:pma_description},
	pma_idioma='${def:locale}',
	pma_usuario='${def:user}',
	pma_fecha_registro={d '${def:date}'},
	pma_hora='${def:time}'

WHERE
	smn_permisos_soporte_id=${fld:id}

