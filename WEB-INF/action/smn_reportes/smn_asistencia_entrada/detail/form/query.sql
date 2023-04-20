select
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	cod1.cva_descripcion,
	case
		when smn_control_acceso.smn_asistencia.asi_tipo_marcaje='ENT' then '${lbl:b_in}'
		when smn_control_acceso.smn_asistencia.asi_tipo_marcaje='SAL' then '${lbl:b_out}'
	end as asi_tipo_marcaje,
	case
		when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='N' then '${lbl:b_not}'
	end as asi_estatus_permiso_rf,
	case
		when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='GEN' then '${lbl:b_in}'
		when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='NGE' then '${lbl:b_out}'
	end as asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencia.smn_plan_asistencia_id,
	smn_base.smn_auxiliar.aux_descripcion as asi_personal_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_evento,
	smn_control_acceso.smn_asistencia.asi_dia_evento,
	smn_gip.smn_turnos.tur_nombre as asi_turno_rf,
	smn_gip.smn_esquema_rotacion.ero_nombre as asi_esquema_rotacion_rf,
	smn_control_acceso.smn_asistencia.asi_hora_tope_evento,
	smn_control_acceso.smn_asistencia.asi_fecha_registro,
	smn_control_acceso.smn_asistencia.asi_estatus_marcaje,
	smn_control_acceso.smn_asistencia.*
	
from
	smn_control_acceso.smn_asistencia
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
	left join smn_gip.smn_codigo_variable cod1 on cod1.smn_codigo_variable_id = smn_control_acceso.smn_asistencia.smn_codigo_variable_1
	left join smn_gip.smn_codigo_variable cod2 on cod2.smn_codigo_variable_id = smn_control_acceso.smn_asistencia.smn_codigo_variable_2
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left join smn_gip.smn_turnos on smn_gip.smn_turnos.smn_turnos_id = smn_control_acceso.smn_asistencia.asi_turno_rf
	left join smn_gip.smn_esquema_rotacion on  smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_asistencia.asi_esquema_rotacion_rf
	
where
		smn_control_acceso.smn_asistencia.smn_asistencia_id = ${fld:id}
