INSERT INTO smn_control_acceso.smn_plan_asistencia
(
	smn_plan_asistencia_id,
	smn_empresa_rf,
	smn_sucursal_rf,
	smn_estructura_organizacional_rf,
	smn_esquema_rotacion_id,
	cpa_fecha_desde_cal,
	cpa_fecha_hasta_cal,
	cpa_fecha_generado,
	cpa_ano,
	cpa_num_semana_ini,
	cpa_num_semana_fin,
	cpa_fecha_vigencia,
	cpa_status,
	cpa_idioma,
	cpa_usuario,
	cpa_fecha_registro,
	cpa_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_plan_asistencia},
	${fld:smn_empresa_rf},
	${fld:smn_sucursal_rf},
	${fld:smn_estructura_organizacional_rf},
	${fld:smn_esquema_rotacion_id},
	${fld:cpa_fecha_desde_cal},
	${fld:cpa_fecha_hasta_cal},
	${fld:cpa_fecha_generado},
	${fld:cpa_ano},
	${fld:cpa_num_semana_ini},
	${fld:cpa_num_semana_fin},
	${fld:cpa_fecha_vigencia},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)