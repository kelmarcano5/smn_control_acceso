select
	sum(smn_control_acceso.smn_personal.smn_personal_id) as total	
	
from
	smn_control_acceso.smn_asistencia
	INNER JOIN smn_control_acceso.smn_personal on (smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf)
	INNER JOIN smn_base.smn_entidades ON (smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf)
	left outer JOIN smn_base.smn_sucursales ON (smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf)
	left outer JOIN smn_base.smn_estructura_organizacional ON (smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf)
GROUP BY eor_nombre, smn_personal_id