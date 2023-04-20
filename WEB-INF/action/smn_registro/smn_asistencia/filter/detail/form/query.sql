select
select
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	cva_descripcion,
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
select
select
select
select
	smn_control_acceso.smn_asistencia.*
from
	smn_control_acceso.smn_personal,
	smn_gip.smn_codigo_variable,
	smn_control_acceso.smn_asistencia
where
	smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf and
	smn_gip.smn_codigo_variable.smn_codigo_variable_id = smn_control_acceso.smn_asistencia.asi_variable_1 and
	smn_asistencia_id = ${fld:id}
