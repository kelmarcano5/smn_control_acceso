select
		smn_control_acceso.smn_asistencias.asi_id_control_acceso,
	smn_control_acceso.smn_asistencias.asi_clase_auxiliar_rf,
	smn_control_acceso.smn_asistencias.asi_auxiliar_rf,
	smn_control_acceso.smn_asistencias.asi_fecha,
	smn_control_acceso.smn_asistencias.asi_estatus_permiso_rf,
	smn_control_acceso.smn_asistencias.asi_turno_rf,
	smn_control_acceso.smn_asistencias.asi_esquema_rotacion_rf,
	smn_control_acceso.smn_asistencias.asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencias.asi_fecha_registro
from
	smn_control_acceso.smn_asistencias 
where
	smn_control_acceso.smn_asistencias.smn_asistencias_id = ${fld:id}
