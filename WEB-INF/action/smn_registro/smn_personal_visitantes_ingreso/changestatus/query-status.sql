UPDATE smn_control_acceso.smn_personal_visitantes
SET rpv_estatus = (CASE WHEN (rpv_estatus = 'GE') THEN 'RE'
			ELSE 'GE'
 END),
 	rpv_idioma='${def:locale}',
	rpv_usuario='${def:user}',
	rpv_fecha_registro={d '${def:date}'},
	rpv_hora='${def:time}'
WHERE smn_personal_visitantes_id = ${fld:id}