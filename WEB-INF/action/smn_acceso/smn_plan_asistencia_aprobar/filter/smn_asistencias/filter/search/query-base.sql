select
	
	smn_gip.smn_esquema_rotacion.ero_nombre,
	smn_gip.smn_turnos.tur_nombre,
	smn_control_acceso.smn_asistencia.smn_asistencia_id,
		smn_control_acceso.smn_asistencia.smn_asistencia_id as smn_asistencias_id,
	case
	when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='S' then '${lbl:b_yes}'
	when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='N' then '${lbl:b_not}'
	end as asi_estatus_permiso_rf,
	case
	when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='AP' then '${lbl:b_aprobated}'
	when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='GE' then '${lbl:b_generated}'
	when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='NG' then '${lbl:b_not_generated}'
	end as asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencia.asi_id_control_acceso,
	smn_base.smn_auxiliar.aux_nombres||' - '|| smn_base.smn_auxiliar.aux_apellidos as asi_personal_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_evento,
	case
		when smn_control_acceso.smn_asistencia.asi_dia_evento='lu' then 'Lunes'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='ma' then 'Martes'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='mi' then 'Miercoles'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='ju' then 'Jueves'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='vi' then 'Viernes'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='sa' then 'Sabado'
		when smn_control_acceso.smn_asistencia.asi_dia_evento='do' then 'Domingo'
	end as asi_dia_evento,
	CASE
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='ENT' THEN 'Entrada'
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='SAL'	then 'Salida'
	end as asi_tipo_marcaje,
	smn_control_acceso.smn_asistencia.asi_hora_tope_evento,
	smn_control_acceso.smn_asistencia.asi_fecha_registro,
	smn_control_acceso.smn_asistencia.asi_secuencia_tipo_marcaje
from
	smn_control_acceso.smn_asistencia	
	left outer join smn_gip.smn_esquema_rotacion on smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_asistencia.asi_esquema_rotacion_rf
		left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = 	smn_control_acceso.smn_asistencia.asi_personal_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_gip.smn_turnos on smn_gip.smn_turnos.smn_turnos_id = smn_control_acceso.smn_asistencia.asi_turno_rf
where
	smn_asistencia_id is not null
	${filter}
order by
		smn_asistencia_id
