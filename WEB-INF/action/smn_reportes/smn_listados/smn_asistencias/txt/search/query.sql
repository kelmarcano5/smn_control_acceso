select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_gip.smn_esquema_rotacion.ero_nombre,
	smn_control_acceso.smn_turnos.tur_nombre,
		smn_control_acceso.smn_asistencias.smn_asistencias_id,
	case
	when smn_control_acceso.smn_asistencias.asi_estatus_permiso_rf='S' then '${lbl:b_yes}'
	when smn_control_acceso.smn_asistencias.asi_estatus_permiso_rf='N' then '${lbl:b_not}'
	end as asi_estatus_permiso_rf,
	case
	when smn_control_acceso.smn_asistencias.asi_estatus_asistencia_rf='GEN' then '${lbl:b_generated}'
	when smn_control_acceso.smn_asistencias.asi_estatus_asistencia_rf='NGE' then '${lbl:b_not_generated}'
	end as asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencias.asi_id_control_acceso,
	smn_control_acceso.smn_asistencias.asi_clase_auxiliar_rf,
	smn_control_acceso.smn_asistencias.asi_auxiliar_rf,
	smn_control_acceso.smn_asistencias.asi_fecha,
	smn_control_acceso.smn_asistencias.asi_estatus_permiso_rf,
	smn_control_acceso.smn_asistencias.asi_turno_rf,
	smn_control_acceso.smn_asistencias.asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencias.asi_fecha_registro
from

	smn_base.smn_v_auxiliar,
	smn_base.smn_clase_auxiliar,
	smn_gip.smn_esquema_rotacion,
	smn_control_acceso.smn_turnos,
	smn_control_acceso.smn_asistencias
where
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_asistencias.asi_auxiliar_rf and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_asistencias.asi_clase_auxiliar_rf and
	smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_asistencias.asi_esquema_rotacion_rf and
	smn_control_acceso.smn_turnos.smn_turnos_id = smn_control_acceso.smn_asistencias.asi_turno_rf
