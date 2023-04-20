UPDATE smn_control_acceso.smn_solicitud_permisos SET
	spe_estatus_rf='APR'

WHERE
	smn_solicitud_permisos_id=${fld:id};

UPDATE smn_expedientes.smn_control_vacaciones SET
	cva_estatus_proceso='SO', cva_fecha_aprobacion={d '${def:date}'}
WHERE
	smn_expedientes.smn_control_vacaciones.smn_control_vacaciones_id in (Select smn_control_vacaciones_id from smn_expedientes.smn_rel_control_vacaciones_permisos
	where  smn_solicitud_permisos_rf=${fld:id});
