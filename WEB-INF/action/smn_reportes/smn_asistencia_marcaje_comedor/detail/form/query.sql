select DISTINCT
	smn_control_acceso.smn_asistencia.smn_asistencia_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_empresa_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos as asi_personal_rf,
	CASE
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='ENT' THEN 'Entrada'
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='SAL'	then 'Salida'
		WHEN smn_control_acceso.smn_asistencia.asi_tipo_marcaje='CO'	then 'Indefinido'
	end as tipo_movimiento,
	smn_control_acceso.smn_asistencia.asi_fecha_evento as fecha,
	smn_control_acceso.smn_asistencia.asi_hora_marcaje as hora,
	CASE
		WHEN smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='AP' THEN 'Aprobado'
		WHEN smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='GE'	then 'Generado'
		WHEN smn_control_acceso.smn_asistencia.asi_estatus_asistencia_rf='RZ'	then 'Rechazado'
	end as estatus
from
	smn_control_acceso.smn_asistencia
	INNER JOIN smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia.asi_personal_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	INNER JOIN smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf
	left outer JOIN smn_base.smn_sucursales ON smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf
	left outer JOIN smn_base.smn_estructura_organizacional ON smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
where
	smn_asistencia_id = ${fld:id}