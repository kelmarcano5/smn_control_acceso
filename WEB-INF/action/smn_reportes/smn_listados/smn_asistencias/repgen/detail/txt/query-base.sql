select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_gip.smn_esquema_rotacion.ero_nombre,
	smn_control_acceso.smn_turnos.tur_nombre,
	${field}
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
	smn_control_acceso.smn_turnos.smn_turnos_id = smn_control_acceso.smn_asistencias.asi_turno_rf and
		smn_control_acceso.smn_asistencias.smn_asistencias_id = ${fld:id}
	
