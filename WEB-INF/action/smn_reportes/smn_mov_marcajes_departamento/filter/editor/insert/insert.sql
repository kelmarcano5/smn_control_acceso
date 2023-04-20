INSERT INTO smn_control_acceso.smn_mov_marcajes
(
	smn_mov_marcajes_id,
	mrk_documento_rf,
	mrk_sede,
	mrk_empresa_rf,
	mrk_sucursal_rf,
	mrk_area_servicio_rf,
	mrk_unidad_servicio_rf,
	mrk_centro_costo_rf,
	mrk_clase_auxiliar_rf,
	mrk_auxiliar_rf,
	mrk_cargo_rf,
	mrk_categoria_cargo_rf,
	mrk_control_acceso_id,
	mrk_dispositivo_codigo,
	mrk_marcaje_id,
	mrk_marcaje_fecha,
	mrk_marcaje_hora,
	mrk_marcaje_dia_rf,
	mrk_marcaje_tipo_rf,
	mrk_turno_rf,
	mrk_consecutivo,
	mrk_transaccion_rf,
	mrk_horas_retrasos,
	mrk_horas_ausencias,
	mrk_horas_descanso,
	mrk_idioma,
	mrk_usuario,
	mrk_fecha_registro,
	mrk_hora
)
VALUES
(
	${seq:currval@smn_control_acceso.seq_smn_mov_marcajes},
	${fld:mrk_documento_rf},
	${fld:mrk_sede},
	${fld:mrk_empresa_rf},
	${fld:mrk_sucursal_rf},
	${fld:mrk_area_servicio_rf},
	${fld:mrk_unidad_servicio_rf},
	${fld:mrk_centro_costo_rf},
	${fld:mrk_clase_auxiliar_rf},
	${fld:mrk_auxiliar_rf},
	${fld:mrk_cargo_rf},
	${fld:mrk_categoria_cargo_rf},
	${fld:mrk_control_acceso_id},
	${fld:mrk_dispositivo_codigo},
	${fld:mrk_marcaje_id},
	${fld:mrk_marcaje_fecha},
	${fld:mrk_marcaje_hora},
	${fld:mrk_marcaje_dia_rf},
	${fld:mrk_marcaje_tipo_rf},
	${fld:mrk_turno_rf},
	${fld:mrk_consecutivo},
	${fld:mrk_transaccion_rf},
	${fld:mrk_horas_retrasos},
	${fld:mrk_horas_ausencias},
	${fld:mrk_horas_descanso},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)