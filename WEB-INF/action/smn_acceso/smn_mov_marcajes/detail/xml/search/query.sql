select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_v_auxiliar.smn_item,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cac_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_gip.smn_documentos.smn_documentos_generales_rf as dcm_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	case
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='DO' then '${lbl:b_sunday}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='LU' then '${lbl:b_monday}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='MA' then '${lbl:b_tuesday}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='MI' then '${lbl:b_wednesday}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='JU' then '${lbl:b_thursday}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='VI' then '${lbl:b_friday}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia_rf='SA' then '${lbl:b_saturday}'
	end as mrk_marcaje_dia_rf_combo,
	case
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf='ENT' then '${lbl:b_entry}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf='SAL' then '${lbl:b_exit}'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf='ESL' then '${lbl:b_entry_exit}'
	end as mrk_marcaje_tipo_rf_combo,
	smn_control_acceso.smn_mov_marcajes.*
from
	smn_control_acceso.smn_mov_marcajes
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_mov_marcajes.mrk_area_servicio_rf
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_mov_marcajes.mrk_auxiliar_rf
	inner join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_mov_marcajes.mrk_cargo_rf
	inner join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_mov_marcajes.mrk_categoria_cargo_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_mov_marcajes.mrk_centro_costo_rf
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_mov_marcajes.mrk_clase_auxiliar_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_mov_marcajes.mrk_documento_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.mrk_empresa_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_mov_marcajes.mrk_sucursal_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_mov_marcajes.mrk_unidad_servicio_rf
where
	smn_mov_marcajes_id = ${fld:id}
