UPDATE smn_control_acceso.smn_asistencia_comedor SET
	com_estatus='EN',
	com_hora_entregada='${def:time}'

WHERE
	smn_asistencia_comedor_id=${fld:id}


