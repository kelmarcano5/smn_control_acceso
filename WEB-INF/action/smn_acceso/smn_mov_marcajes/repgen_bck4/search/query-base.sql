select
${field},
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_v_auxiliar.smn_item as smn_personal_rf,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cac_nombre as smn_categoria_cargo_rf,
	smn_base.smn_centro_costo.cco_descripcion_corta as smn_centro_costo_rf,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_gip.smn_documentos.dcm_descripcion as smn_documento_id,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id,
	smn_gip.smn_dispositivos.dis_descripcion as mrk_dispositivo_codigo,
	smn_base.smn_areas_servicios.ase_descripcion as smn_area_rf
	
	
from
	smn_control_acceso.smn_mov_marcajes
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_mov_marcajes.smn_personal_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_area_rf
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_cargo_rf
	inner join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_categoria_cargo_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_mov_marcajes.smn_centro_costo_rf
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_mov_marcajes.smn_documento_id
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_mov_marcajes.smn_sucursal_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_unidad_servicio_rf
    left outer join smn_gip.smn_dispositivos on smn_gip.smn_dispositivos.smn_dispositivos_id=mrk_dispositivo_codigo
where
		smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id is not null
	${filter}
	
	
