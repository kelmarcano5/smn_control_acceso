select
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	cva_descripcion,
		smn_control_acceso.smn_asistencia.smn_asistencia_id,
	${field}
from
	smn_control_acceso.smn_personal,
	smn_gip.smn_codigo_variable,
	smn_control_acceso.smn_asistencia
where
	smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf and
	smn_gip.smn_codigo_variable.smn_codigo_variable_id = smn_control_acceso.smn_asistencia.asi_variable_1 and
		smn_control_acceso.smn_asistencia.smn_asistencia_id is not null
	${filter}
	
	
