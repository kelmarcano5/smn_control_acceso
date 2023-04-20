INSERT INTO smn_control_acceso.smn_plan_asistencia
(
	smn_plan_asistencia_id,
	smn_empresa_rf,
	smn_sucursal_rf,
	smn_estructura_organizacional_rf,
	cpa_fecha_desde_cal,
	cpa_fecha_hasta_cal,
	cpa_fecha_generado,
	smn_esquema_rotacion_id,
	cpa_ano,
	cpa_num_semana_ini,
	cpa_num_semana_fin,
	cpa_status,
	cpa_fecha_vigencia,
	cpa_idioma,
	cpa_usuario,
	cpa_fecha_registro,
	cpa_hora
)
VALUES
(
	${seq:nextval@seq_smn_plan_asistencia},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	'RE',
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
