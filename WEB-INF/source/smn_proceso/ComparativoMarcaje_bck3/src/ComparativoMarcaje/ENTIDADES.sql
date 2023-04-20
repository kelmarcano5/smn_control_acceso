Select 
	smn_asistencia.asi_personal_rf, 
	smn_personal.psl_esquema_rotacion_rf, 
	smn_personal.psl_estructura_organizacional_rf, 
	smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_detalle_id, 
	smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id , 
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_lunes_id as lunes, 
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_martes_id as martes, 
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_miercoles_id as miercoles, 
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_jueves_id as jueves, 
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_viernes_id as viernes,  
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_sabado_id as sabado, 
	smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id as domingo,smn_base.smn_entidades.smn_entidades_id 

	from smn_control_acceso.smn_asistencia 

	INNER JOIN smn_control_acceso.smn_personal on smn_personal.smn_personal_id = smn_asistencia.asi_personal_rf 
	inner join smn_gip.smn_esquema_rotacion_detalle on smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id = smn_personal.psl_esquema_rotacion_rf 
	inner join( smn_base.smn_estructura_organizacional 
			inner join (smn_base.smn_configuracion_estructura 
					inner join ( smn_base.smn_rel_entidad_estructura 
					 		inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_base.smn_rel_entidad_estructura.smn_entidades_id 
					 		) on smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id = smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id 
					 ) on smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id = smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id 
			) on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_personal.psl_estructura_organizacional_rf 
	

      				 INNER JOIN smn_control_acceso.smn_plan_asistencia on smn_plan_asistencia.smn_plan_asistencia_id = smn_asistencia.smn_plan_asistencia_id 
      				
where asi_fecha_evento between 'dia_ini"' and 'dia_fin"' and smn_plan_asistencia.cpa_status = 'AP' 
      				
group by 
smn_asistencia.asi_personal_rf,
smn_personal.psl_esquema_rotacion_rf,
smn_personal.psl_estructura_organizacional_rf,
smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_detalle_id,
smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id ,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_lunes_id,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_martes_id,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_miercoles_id,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_jueves_id,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_viernes_id,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_sabado_id,
smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id,
smn_base.smn_entidades.smn_entidades_id;
