select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_v_auxiliar.smn_item,
	(select
		smn_base.smn_v_auxiliar.smn_item
	 from 
	 	smn_base.smn_v_auxiliar
	 where 
	 	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = ${fld:mrk_auxiliar_filter}) as auxiliar_filter,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cac_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	smn_control_acceso.smn_movimiento_marcajes.smn_movimiento_marcajes_id,
	case
		when ${fld:mrk_marcaje_dia_filter}='DO' then '${lbl:b_sunday}'
		when ${fld:mrk_marcaje_dia_filter}='LU' then '${lbl:b_monday}'
		when ${fld:mrk_marcaje_dia_filter}='MA' then '${lbl:b_tuesday}'
		when ${fld:mrk_marcaje_dia_filter}='MI' then '${lbl:b_wednesday}'
		when ${fld:mrk_marcaje_dia_filter}='JU' then '${lbl:b_thursday}'
		when ${fld:mrk_marcaje_dia_filter}='VI' then '${lbl:b_friday}'
		when ${fld:mrk_marcaje_dia_filter}='SA' then '${lbl:b_saturday}'
	end as mrk_marcaje_dia_combo_filter,
	case
		when ${fld:mrk_marcaje_tipo_filter}='ENT' then '${lbl:b_entry}'
		when ${fld:mrk_marcaje_tipo_filter}='SAL' then '${lbl:b_exit}'
		when ${fld:mrk_marcaje_tipo_filter}='ESL' then '${lbl:b_entry_exit}'
	end as mrk_marcaje_tipo_combo_filter,
	case
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='DO' then '${lbl:b_sunday}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='LU' then '${lbl:b_monday}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='MA' then '${lbl:b_tuesday}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='MI' then '${lbl:b_wednesday}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='JU' then '${lbl:b_thursday}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='VI' then '${lbl:b_friday}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia='SA' then '${lbl:b_saturday}'
	end as mrk_marcaje_dia_combo,
	case
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_tipo='ENT' then '${lbl:b_entry}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_tipo='SAL' then '${lbl:b_exit}'
		when smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_tipo='ESL' then '${lbl:b_entry_exit}'
	end as mrk_marcaje_tipo_combo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_dispositivo_codigo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_fecha,
	smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_hora,
	smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_dia,
	smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_tipo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_tiempo_efectivo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_turno,
	smn_control_acceso.smn_movimiento_marcajes.mrk_consecutivo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_fecha_registro,
	smn_control_acceso.smn_movimiento_marcajes.mrk_auxiliar,
	smn_control_acceso.smn_movimiento_marcajes.mrk_clase_auxiliar,
	smn_control_acceso.smn_movimiento_marcajes.mrk_control_acceso_id,
	smn_control_acceso.smn_movimiento_marcajes.mrk_empresa,
	smn_control_acceso.smn_movimiento_marcajes.mrk_sucursal,
	smn_control_acceso.smn_movimiento_marcajes.mrk_area_servicio,
	smn_control_acceso.smn_movimiento_marcajes.mrk_unidad_servicio,
	smn_control_acceso.smn_movimiento_marcajes.mrk_centro_costo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_cargo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_categoria_cargo,
	smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_id
from
	smn_control_acceso.smn_movimiento_marcajes
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_movimiento_marcajes.mrk_area_servicio
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_movimiento_marcajes.mrk_auxiliar
	inner join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_movimiento_marcajes.mrk_cargo
	inner join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_movimiento_marcajes.mrk_categoria_cargo
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_movimiento_marcajes.mrk_centro_costo
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_movimiento_marcajes.mrk_clase_auxiliar
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_movimiento_marcajes.mrk_empresa
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_movimiento_marcajes.mrk_sucursal
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_movimiento_marcajes.mrk_unidad_servicio
where
	smn_control_acceso.smn_movimiento_marcajes.smn_movimiento_marcajes_id = ${fld:id}
