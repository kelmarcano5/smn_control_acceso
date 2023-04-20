select	
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
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_movimiento_marcajes.mrk_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as mrk_auxiliar_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo || ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_control_acceso.smn_movimiento_marcajes.mrk_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as mrk_clase_auxiliar_combo,
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_control_acceso.smn_movimiento_marcajes.mrk_empresa  order by smn_base.smn_entidades.ent_descripcion_corta ) as mrk_empresa_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_control_acceso.smn_movimiento_marcajes.mrk_sucursal  order by smn_base.smn_sucursales.suc_nombre ) as mrk_sucursal_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_control_acceso.smn_movimiento_marcajes.mrk_area_servicio  order by smn_base.smn_areas_servicios.ase_descripcion ) as mrk_area_servicio_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_control_acceso.smn_movimiento_marcajes.mrk_unidad_servicio  order by smn_base.smn_unidades_servicios.uns_descripcion ) as mrk_unidad_servicio_combo,
	(select smn_base.smn_centro_costo.cco_codigo || ' - ' || smn_base.smn_centro_costo.cco_descripcion_corta from  smn_base.smn_centro_costo  where smn_base.smn_centro_costo.smn_centro_costo_id is not null  and smn_base.smn_centro_costo.smn_centro_costo_id=smn_control_acceso.smn_movimiento_marcajes.mrk_centro_costo  order by  smn_base.smn_centro_costo.cco_descripcion_corta ) as mrk_centro_costo_combo,
	(select smn_gip.smn_cargos.job_codigo|| ' - ' || smn_gip.smn_cargos.job_nombre from  smn_gip.smn_cargos  where smn_gip.smn_cargos.smn_cargos_id is not null  and smn_gip.smn_cargos.smn_cargos_id=smn_control_acceso.smn_movimiento_marcajes.mrk_cargo  order by smn_gip.smn_cargos.job_nombre ) as mrk_cargo_combo,
	(select smn_gip.smn_categoria_cargos.cat_codigo || ' - ' || smn_gip.smn_categoria_cargos.cat_nombre from  smn_gip.smn_categoria_cargos  where smn_gip.smn_categoria_cargos.smn_categoria_cargos_id is not null  and smn_gip.smn_categoria_cargos.smn_categoria_cargos_id=smn_control_acceso.smn_movimiento_marcajes.mrk_categoria_cargo  order by smn_gip.smn_categoria_cargos.cat_nombre ) as mrk_categoria_cargo_combo,
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
	smn_control_acceso.smn_movimiento_marcajes.mrk_marcaje_id,
	smn_control_acceso.smn_movimiento_marcajes.smn_movimiento_marcajes_id

from
	smn_control_acceso.smn_movimiento_marcajes
where
	smn_movimiento_marcajes_id is not null	
 	 	${filter}
order by 
	smn_movimiento_marcajes_id