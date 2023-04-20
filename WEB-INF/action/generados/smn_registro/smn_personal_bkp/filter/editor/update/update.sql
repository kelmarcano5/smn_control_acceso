UPDATE smn_personal SET
	psl_num_control=${fld:psl_num_control},
	psl_clase_auxiliar=${fld:psl_clase_auxiliar},
	psl_auxiliar=${fld:psl_auxiliar},
	psl_habilita_acceso=${fld:psl_habilita_acceso},
	psl_id_control_acceso=${fld:psl_id_control_acceso},
	psl_idioma='${def:locale}',
	psl_usuario='${def:user}',
	psl_fecha_registro={d '${def:date}'},
	psl_hora='${def:time}'

WHERE
	smn_personal_id=${fld:id}

