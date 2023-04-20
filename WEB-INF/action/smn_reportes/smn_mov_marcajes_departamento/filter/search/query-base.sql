select DISTINCT
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_gip.smn_cargos.job_codigo ||' - '|| smn_gip.smn_cargos.job_nombre as smn_cargo_rf,
	--smn_base.smn_areas_servicios.ase_codigo ||' - '|| smn_base.smn_areas_servicios.ase_descripcion as smn_area_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as departamento,
	smn_gip.smn_dispositivos.dis_codigo ||' - '|| smn_gip.smn_dispositivos.dis_serial as dispositivo,
	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora as hora_transaccion,
	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_fecha as fecha_transaccion,
	smn_base.smn_auxiliar.aux_descripcion as nombre,
	smn_base.smn_auxiliar.aux_num_doc_oficial as cedula,
	smn_control_acceso.smn_mov_marcajes.mrk_fecha_registro,
	smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id
	
from
	smn_control_acceso.smn_mov_marcajes
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_area_rf
	left outer join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_cargo_rf
	left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_categoria_cargo_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_mov_marcajes.smn_documento_id
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_mov_marcajes.smn_sucursal_rf
	inner join smn_gip.smn_dispositivos on smn_gip.smn_dispositivos.smn_dispositivos_id = cast(smn_control_acceso.smn_mov_marcajes.mrk_dispositivo_codigo as integer)
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_mov_marcajes.smn_personal_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_estructura_organizacional.eor_aprobador 
	inner join smn_base.smn_estructura_organizacional sup on sup.eor_aprobador = smn_base.smn_usuarios.smn_auxiliar_rf
	inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
WHERE 
	smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id is not null  
	and
	sup.eor_aprobador = smn_base.smn_usuarios.smn_auxiliar_rf
	and 
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	and 
	smn_seguridad.s_user.userlogin='${def:user}' 
	${filter}
order by
		smn_mov_marcajes_id
