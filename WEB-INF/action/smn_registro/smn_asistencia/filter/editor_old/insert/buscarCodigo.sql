select
		smn_control_acceso.smn_asistencia.smn_codigo_variable_2
from
		smn_control_acceso.smn_asistencia
where
		upper(smn_control_acceso.smn_asistencia.smn_codigo_variable_2) = upper(${fld:smn_codigo_variable_2})
