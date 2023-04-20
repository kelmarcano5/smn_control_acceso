select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_v_auxiliar.smn_item,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cat_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	${field}
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
		smn_control_acceso.smn_movimiento_marcajes.smn_movimiento_marcajes_id is not null
