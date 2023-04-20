select
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_gip.smn_cargos.job_codigo ||' - '|| smn_gip.smn_cargos.job_nombre as smn_cargo_rf,
	smn_base.smn_areas_servicios.ase_codigo ||' - '|| smn_base.smn_areas_servicios.ase_descripcion as smn_area_rf,
	smn_base.smn_centro_costo.cco_codigo ||' - '||  smn_base.smn_centro_costo.cco_descripcion_corta as departamento,
	smn_gip.smn_dispositivos.dis_codigo ||' - '|| smn_gip.smn_dispositivos.dis_serial as dispositivo,
	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora as hora_transaccion,
	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_fecha as fecha_transaccion,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as nombre,
	smn_control_acceso.smn_mov_marcajes.mrk_fecha_registro,
		smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id
	
from
	smn_control_acceso.smn_mov_marcajes
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_area_rf
	left outer join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_cargo_rf
	left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_categoria_cargo_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_mov_marcajes.smn_centro_costo_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_mov_marcajes.smn_documento_id
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_mov_marcajes.smn_sucursal_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_unidad_servicio_rf
	inner join smn_gip.smn_dispositivos on smn_gip.smn_dispositivos.smn_dispositivos_id = cast(smn_control_acceso.smn_mov_marcajes.mrk_dispositivo_codigo as integer)
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_mov_marcajes.smn_personal_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
where
	smn_mov_marcajes_id is not null
	${filter}
order by
		smn_mov_marcajes_id
