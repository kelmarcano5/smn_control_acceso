select
	
	smn_gip.smn_esquema_rotacion.ero_nombre,
	smn_gip.smn_turnos.tur_nombre,
	smn_control_acceso.smn_asistencia.smn_asistencia_id,
	case
	when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='S' then '${lbl:b_yes}'
	when smn_control_acceso.smn_asistencia.asi_estatus_permiso_rf='N' then '${lbl:b_not}'
	end as asi_estatus_permiso_rf,
	case
	when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='GEN' then '${lbl:b_generated}'
	when smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='NGE' then '${lbl:b_not_generated}'
	end as asi_estatus_asistencia_rf,
	smn_control_acceso.smn_asistencia.asi_id_control_acceso,
	smn_base.smn_clase_auxiliar.cla_nombre as asi_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_codigo||''|| smn_base.smn_auxiliar.aux_descripcion as asi_auxiliar_rf,
	smn_control_acceso.smn_asistencia.asi_fecha_evento,
	smn_control_acceso.smn_asistencia.asi_fecha_registro,
	smn_control_acceso.smn_asistencia.*
from
	smn_control_acceso.smn_asistencia	
	left outer join smn_gip.smn_esquema_rotacion on smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_asistencia.asi_esquema_rotacion_rf
	left outer join smn_gip.smn_personal on smn_gip.smn_personal.smn_personal_id = 	smn_control_acceso.smn_asistencia.asi_personal_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_gip.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_gip.smn_personal.psl_clase_auxiliar_rf
	left outer join smn_gip.smn_turnos on smn_gip.smn_turnos.smn_turnos_id = smn_control_acceso.smn_asistencia.asi_turno_rf

where
	smn_asistencias_id = ${fld:id}
