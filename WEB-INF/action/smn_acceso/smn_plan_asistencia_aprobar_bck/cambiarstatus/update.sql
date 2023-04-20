UPDATE smn_control_acceso.smn_plan_asistencia SET
	cpa_status=	'AP'
WHERE
	smn_plan_asistencia_id=${fld:id};

UPDATE smn_control_acceso.smn_asistencia SET
	asi_estatus_asistencia_rf=	'AP'
WHERE
	smn_plan_asistencia_id=${fld:id};

