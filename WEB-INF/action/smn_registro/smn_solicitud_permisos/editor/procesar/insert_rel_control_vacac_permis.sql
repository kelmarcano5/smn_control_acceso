INSERT INTO smn_expedientes.smn_rel_control_vacaciones_permisos
(
	smn_rel_control_vacaciones_permisos_id,
	smn_control_vacaciones_id,
	smn_solicitud_permisos_rf,
	rvp_dia_sol,
	rvp_idioma,
    rvp_usuario,
    rvp_fecha_registro,
    rvp_hora
 )
VALUES
(
	nextval('smn_expedientes.seq_smn_rel_control_vacaciones_permisos'),
	${fld:smn_control_vacaciones},
	${fld:smn_solicitud_permisos_id},
	${fld:spe_cantidad_dias},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)