INSERT INTO smn_control_acceso.smn_control_plan_asistencia
(
	smn_control_plan_asistencia_id,
	smn_empresa_rf,
	smn_sucursal_rf,
	smn_estructura_organizacional_rf,
	smn_personal_id,
	cpa_ano,
	cpa_num_semana_ini_id,
	cpa_num_semana_fin_id,
	cpa_fecha_desde_calc,
	cpa_fecha_hasta_calc,
	cpa_fecha_generado,
	cpa_status,
	cpa_fecha_vigencia,
	cpa_idioma,
	cpa_usuario,
	cpa_fecha_registro,
	cpa_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_control_plan_asistencia},
	${fld:smn_empresa_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_estructura_organizacional_rf},
	${fld:smn_personal_id},
	${fld:cpa_ano},
	${fld:cpa_num_semana_ini_id},
	${fld:cpa_num_semana_fin_id},
	${fld:cpa_fecha_desde_calc},
	${fld:cpa_fecha_hasta_calc},
	${fld:cpa_fecha_generado},
	${fld:cpa_status},
	${fld:cpa_fecha_vigencia},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
