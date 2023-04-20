INSERT INTO smn_control_acceso.smn_control_plan_asistencia
(
	smn_control_plan_asistencia_id,
	smn_empresa_rf,
	smn_sucursal_rf,
	smn_estructura_organizacional_rf,
	smn_personal_id,
	cpa_ano ,
	cpa_num_semana_ini_id,
	cpa_num_semana_fin_id,
	cpa_fecha_desde_calc,
	cpa_fecha_hasta_calc,
	cpa_fecha_generado,
	cpa_status,
	cpa_fecha_vigencia,
	cpa_fecha_registro
)
VALUES
(
	${seq:nextval@smn_control_acceso.seq_smn_control_plan_asistencia},
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
	?,
	?,
	{d '${def:date}'}
)
