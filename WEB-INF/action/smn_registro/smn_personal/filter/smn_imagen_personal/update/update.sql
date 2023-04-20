UPDATE smn_control_acceso.smn_imagen_personal SET
	smn_personal_id=${fld:smn_personal_id},
	imp_descripcion=${fld:imp_descripcion}

WHERE
	smn_imagen_personal_id=${fld:id}

