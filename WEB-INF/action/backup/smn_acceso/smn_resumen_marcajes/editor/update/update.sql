UPDATE smn_control_acceso.smn_resumen_marcajes SET
	igs_auxiliar=${fld:igs_auxiliar},
	igs_clase_auxiliar=${fld:igs_clase_auxiliar},
	igs_control_acceso_id=${fld:igs_control_acceso_id},
	igs_actividad=${fld:igs_actividad},
	igs_tiempo_efectivo=${fld:igs_tiempo_efectivo},
	igs_fecha=${fld:igs_fecha},
	igs_idioma='${def:locale}',
	igs_usuario='${def:user}',
	igs_fecha_registro={d '${def:date}'},
	igs_hora='${def:time}'

WHERE
	smn_resumen_marcajes_id=${fld:id}

