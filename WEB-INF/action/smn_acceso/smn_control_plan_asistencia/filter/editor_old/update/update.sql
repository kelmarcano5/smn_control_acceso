UPDATE smn_control_acceso.smn_control_plan_asistencia SET
	smn_empresa_rf=${fld:smn_empresa_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_estructura_organizacional_rf=${fld:smn_estructura_organizacional_rf},
	smn_personal_id=${fld:smn_personal_id},
	cpa_ano =${fld:cpa_ano },
	cpa_num_semana_ini_id=${fld:cpa_num_semana_ini_id},
	cpa_num_semana_fin_id=${fld:cpa_num_semana_fin_id},
	cpa_fecha_desde_calc=${fld:cpa_fecha_desde_calc},
	cpa_fecha_hasta_calc=${fld:cpa_fecha_hasta_calc},
	cpa_fecha_generado=${fld:cpa_fecha_generado},
	cpa_status=${fld:cpa_status},
	cpa_fecha_vigencia=${fld:cpa_fecha_vigencia},
	cpa_idioma='${def:locale}',
	cpa_usuario='${def:user}',
	cpa_fecha_registro={d '${def:date}'},
	cpa_hora='${def:time}'

WHERE
	smn_control_plan_asistencia_id=${fld:id}

