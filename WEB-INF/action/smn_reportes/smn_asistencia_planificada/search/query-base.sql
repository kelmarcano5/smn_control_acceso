select DISTINCT
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	COUNT(smn_control_acceso.smn_personal.smn_personal_id) AS numero_personal,
	(select smn_control_acceso.smn_asistencia.smn_asistencia_id from smn_control_acceso.smn_asistencia where smn_control_acceso.smn_asistencia.smn_asistencia_id=smn_control_acceso.smn_asistencia.asi_personal_rf) as smn_asistencia_id

	
from
	smn_control_acceso.smn_asistencia
	INNER JOIN smn_control_acceso.smn_personal on (smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf)
	INNER JOIN smn_base.smn_entidades ON (smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf)
	left outer JOIN smn_base.smn_sucursales ON (smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf)
	left outer JOIN smn_base.smn_estructura_organizacional ON (smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf)

where
	smn_asistencia_id is not null
	${filter}
GROUP BY eor_nombre, smn_personal_id
