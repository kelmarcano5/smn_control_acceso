select
		smn_control_acceso.smn_asistencia.smn_plan_asistencia_id,
	smn_control_acceso.smn_asistencia.asi_id_control_acceso,
	smn_control_acceso.smn_asistencia.asi_personal_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_evento,
	smn_control_acceso.smn_asistencia.asi_dia_evento,
	smn_control_acceso.smn_asistencia.asi_turno_rf,
	smn_control_acceso.smn_asistencia.asi_esquema_rotacion_rf,
	smn_control_acceso.smn_asistencia.asi_tipo_marcaje,
	smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf,
	smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_registro,
	smn_control_acceso.smn_asistencia.asi_estatus_marcaje,
	smn_control_acceso.smn_asistencia.asi_secuencia_tipo_marcaje
from
	smn_control_acceso.smn_asistencia 
where
	smn_control_acceso.smn_asistencia.smn_asistencia_id = ${fld:id}
