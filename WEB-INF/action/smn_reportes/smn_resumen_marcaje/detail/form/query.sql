select
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as departamento,
	smn_control_acceso.smn_resumen_marcajes.rmk_fecha as fecha_marcaje,
	smn_base.smn_auxiliar.aux_descripcion as nombre,
	smn_base.smn_auxiliar.aux_num_doc_oficial as cedula,
	smn_control_acceso.smn_resumen_marcajes.smn_resumen_marcajes_id,
	smn_control_acceso.smn_resumen_marcajes.rmk_tiempo_asistencia,
	smn_control_acceso.smn_resumen_marcajes.rmk_tiempo_ausencias,
	smn_control_acceso.smn_resumen_marcajes.rmk_tiempo_extras,
	smn_control_acceso.smn_resumen_marcajes.rmk_tiempo_descanso,
	smn_control_acceso.smn_resumen_marcajes.rmk_tiempo_permisos,
	smn_control_acceso.smn_resumen_marcajes.rmk_tiempo_retrasos,
	smn_gip.smn_horarios.hor_descripcion as smn_horarios_id,
	smn_gip.smn_cargos.job_nombre as smn_cargo_rf,
	smn_control_acceso.smn_resumen_marcajes.rmk_fecha_registro
	
from
	smn_control_acceso.smn_resumen_marcajes
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_resumen_marcajes.smn_centro_costo_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_resumen_marcajes.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_resumen_marcajes.smn_sucursal_rf
	left join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_resumen_marcajes.smn_personal_id
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_personal.psl_cargo_rf
	left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_personal.psl_categoria_cargo_rf
	left join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_entidades_id = smn_control_acceso.smn_resumen_marcajes.smn_entidad_rf
	left join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_resumen_marcajes.smn_estructura_organizacional_rf 
	left join smn_gip.smn_horarios on smn_gip.smn_horarios.smn_horarios_id = smn_control_acceso.smn_resumen_marcajes.smn_horarios_id

where
	smn_control_acceso.smn_resumen_marcajes.smn_resumen_marcajes_id=${fld:id}
