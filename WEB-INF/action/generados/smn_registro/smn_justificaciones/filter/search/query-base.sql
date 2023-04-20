select	
	smn_control_acceso.smn_personal.smn_personal_id, 
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	(select smn_gip.smn_tipo_actividades.tya_codigo || " - "|| smn_gip.smn_tipo_actividades.tya_nombre from  smn_gip.smn_tipo_actividades  where smn_gip.smn_tipo_actividades.smn_tipo_actividades_id is not null  and smn_gip.smn_tipo_actividades.smn_tipo_actividades_id=smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf  order by smn_gip.smn_tipo_actividades.tya_nombre ) as jus_tipo_actividad_rf_combo,
	case
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='APR' then '${lbl:b_approved}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='NAP' then '${lbl:b_not_approved}'
		when smn_control_acceso.smn_justificaciones.jus_estatus_rf='PEN' then '${lbl:b_pending}'
	end as jus_estatus_rf_combo,
	smn_control_acceso.smn_justificaciones.smn_personal_id,
	smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf,
	smn_control_acceso.smn_justificaciones.jus_fecha_incidencia,
	smn_control_acceso.smn_justificaciones.jus_hora_incidencia,
	smn_control_acceso.smn_justificaciones.jus_tiempo_a_justificar,
	smn_control_acceso.smn_justificaciones.jus_estatus_rf,
	smn_control_acceso.smn_justificaciones.jus_fecha_registro,
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id

from
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_justificaciones
where
	smn_justificaciones_id is not null	
and 	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id 
	 	${filter}
order by 
	smn_justificaciones_id