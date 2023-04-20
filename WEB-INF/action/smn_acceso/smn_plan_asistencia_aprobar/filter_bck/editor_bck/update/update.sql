UPDATE smn_control_acceso.smn_plan_asistencia SET
	smn_empresa_rf=${fld:smn_empresa_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_estructura_organizacional_rf=${fld:smn_estructura_organizacional_rf},
	smn_esquema_rotacion_id=${fld:smn_esquema_rotacion_id},
	cpa_fecha_desde_cal=${fld:cpa_fecha_desde_cal},
	cpa_fecha_hasta_cal=${fld:cpa_fecha_hasta_cal},
	cpa_fecha_generado=${fld:cpa_fecha_generado},
	cpa_ano=${fld:cpa_ano},
	cpa_num_semana_ini=${fld:cpa_num_semana_ini},
	cpa_num_semana_fin=${fld:cpa_num_semana_fin},
	cpa_fecha_vigencia=${fld:cpa_fecha_vigencia},
	cpa_status=	'RE',
	cpa_idioma='${def:locale}',
	cpa_usuario='${def:user}',
	cpa_fecha_registro={d '${def:date}'},
	cpa_hora='${def:time}'

WHERE
	smn_plan_asistencia_id=${fld:id}

