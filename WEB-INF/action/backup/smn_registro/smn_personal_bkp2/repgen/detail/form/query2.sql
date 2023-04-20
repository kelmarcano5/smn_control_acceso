select
	smn_base.smn_areas_servicios.ase_descripcion,
	(select
		smn_base.smn_areas_servicios.ase_descripcion
	 from 
	 	smn_base.smn_areas_servicios
	 where 
	 	smn_base.smn_areas_servicios.smn_areas_servicios_id = ${fld:psl_area_servicio_filter}) as area_servicio_filter,
	smn_base.smn_v_auxiliar.smn_item,
	(select
		smn_base.smn_v_auxiliar.smn_item
	 from 
	 	smn_base.smn_v_auxiliar
	 where 
	 	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = ${fld:psl_auxiliar_filter}) as auxiliar_filter,
	smn_gip.smn_cargos.job_nombre,
	(select
		smn_gip.smn_cargos.job_nombre
	 from 
	 	smn_gip.smn_cargos
	 where 
	 	smn_gip.smn_cargos.smn_cargos_id = ${fld:psl_cargo_filter}) as cargo_filter,
	smn_gip.smn_categoria_cargos.cac_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	(select
		smn_base.smn_centro_costo.cco_descripcion_corta
	 from 
	 	smn_base.smn_centro_costo
	 where 
	 	smn_base.smn_centro_costo.smn_centro_costo_id = ${fld:psl_centro_costo_filter}) as centro_costo_filter,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	(select
		smn_base.smn_entidades.ent_descripcion_corta
	 from 
	 	smn_base.smn_entidades
	 where 
	 	smn_base.smn_entidades.smn_entidades_id = ${fld:psl_empresa_filter}) as empresa_filter,
	smn_base.smn_estructura_organizacional.eor_nombre,
	(select
		smn_base.smn_estructura_organizacional.eor_nombre
	 from 
	 	smn_base.smn_estructura_organizacional
	 where 
	 	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = ${fld:psl_estructura_organiz_filter}) as estructura_organiz_filter,
	smn_base.smn_sucursales.suc_nombre,
	(select
		smn_base.smn_sucursales.suc_nombre
	 from 
	 	smn_base.smn_sucursales
	 where 
	 	smn_base.smn_sucursales.smn_sucursales_id = ${fld:psl_sucursal_filter}) as sucursal_filter,
	smn_base.smn_unidades_servicios.uns_descripcion,
	(select
		smn_base.smn_unidades_servicios.uns_descripcion
	 from 
	 	smn_base.smn_unidades_servicios
	 where 
	 	smn_base.smn_unidades_servicios.smn_unidades_servicios_id = ${fld:psl_unidad_servicio_filter}) as unidad_servicio_filter,
	smn_control_acceso.smn_personal.smn_personal_id,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo_filter,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	smn_control_acceso.smn_personal.smn_personal_id,
	smn_control_acceso.smn_personal.psl_habilita_acceso,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_personal.psl_fecha_registro,
	smn_control_acceso.smn_personal.psl_num_control,
	smn_control_acceso.smn_personal.psl_clase_auxiliar,
	smn_control_acceso.smn_personal.psl_auxiliar,
	smn_control_acceso.smn_personal.psl_empresa,
	smn_control_acceso.smn_personal.psl_sucursal,
	smn_control_acceso.smn_personal.psl_area_servicio,
	smn_control_acceso.smn_personal.psl_unidad_servicio,
	smn_control_acceso.smn_personal.psl_centro_costo,
	smn_control_acceso.smn_personal.psl_estructura_organiz,
	smn_control_acceso.smn_personal.psl_cargo,
	smn_control_acceso.smn_personal.psl_categoria_cargo
from
	smn_control_acceso.smn_personal
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_personal.psl_area_servicio
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar
	left outer join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_personal.psl_cargo
	left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_personal.psl_categoria_cargo
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_personal.psl_centro_costo
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organiz
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_personal.psl_unidad_servicio
where
	smn_control_acceso.smn_personal.smn_personal_id = ${fld:id}
