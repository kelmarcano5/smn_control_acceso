select
	sum(smn_control_acceso.smn_personal.smn_personal_id) as total	
from
	smn_control_acceso.smn_asistencia
	INNER JOIN smn_control_acceso.smn_personal on (smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf)
where
 	smn_control_acceso.smn_personal.psl_empresa_rf=${fld:smn_empresa_rf} and
 	smn_control_acceso.smn_personal.psl_sucursal_rf=${fld:smn_sucursal_rf} and
 	smn_control_acceso.smn_personal.psl_estructura_organizacional_rf=${fld:smn_estructura_organizacional_rf}
 GROUP BY smn_personal_id