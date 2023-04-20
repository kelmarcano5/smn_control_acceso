UPDATE smn_control_acceso.smn_asistencia_comedor SET
	smn_asistencia_id=${fld:smn_asistencia_id},
	smn_movimiento_marcaje_id=${fld:smn_movimiento_marcaje_id},
	smn_personal_id=${fld:smn_personal_id},
	com_fecha_generada=${fld:com_fecha_generada},
	com_hora_generada=${fld:com_hora_generada},
	com_hora_marcaje=${fld:com_hora_marcaje},
	com_hora_entregada=${fld:com_hora_entregada},
	com_estatus=${fld:com_estatus},
	com_idioma='${def:locale}',
	com_usuario='${def:user}',
	com_fecha_registro={d '${def:date}'},
	com_hora='${def:time}'

WHERE
	smn_asistencia_comedor_id=${fld:id}

