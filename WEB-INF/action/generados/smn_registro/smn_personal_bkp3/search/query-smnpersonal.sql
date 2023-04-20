select	
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo || ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_control_acceso.smn_personal.psl_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as psl_clase_auxiliar_combo,
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as psl_auxiliar_combo,
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_control_acceso.smn_personal.psl_empresa  order by smn_base.smn_entidades.ent_descripcion_corta ) as psl_empresa_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_control_acceso.smn_personal.psl_sucursal  order by smn_base.smn_sucursales.suc_nombre ) as psl_sucursal_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_control_acceso.smn_personal.psl_area_servicio  order by smn_base.smn_areas_servicios.ase_descripcion ) as psl_area_servicio_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_control_acceso.smn_personal.psl_unidad_servicio  order by smn_base.smn_unidades_servicios.uns_descripcion ) as psl_unidad_servicio_combo,
	(select smn_base.smn_centro_costo.cco_codigo || ' - ' || smn_base.smn_centro_costo.cco_descripcion_corta from  smn_base.smn_centro_costo  where smn_base.smn_centro_costo.smn_centro_costo_id is not null  and smn_base.smn_centro_costo.smn_centro_costo_id=smn_control_acceso.smn_personal.psl_centro_costo  order by  smn_base.smn_centro_costo.cco_descripcion_corta ) as psl_centro_costo_combo,
	(select smn_base.smn_estructura_organizacional.eor_codigo || ' - ' || smn_base.smn_estructura_organizacional.eor_nombre from  smn_base.smn_estructura_organizacional  where smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id is not null  and smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_control_acceso.smn_personal.psl_estructura_organiz  order by smn_base.smn_estructura_organizacional.eor_nombre ) as psl_estructura_organiz_combo,
	(select smn_gip.smn_cargos.job_codigo|| ' - ' || smn_gip.smn_cargos.job_nombre from  smn_gip.smn_cargos  where smn_gip.smn_cargos.smn_cargos_id is not null  and smn_gip.smn_cargos.smn_cargos_id=smn_control_acceso.smn_personal.psl_cargo  order by smn_gip.smn_cargos.job_nombre ) as psl_cargo_combo,
	(select smn_gip.smn_categoria_cargos.cat_codigo || ' - ' || smn_gip.smn_categoria_cargos.cat_nombre from  smn_gip.smn_categoria_cargos  where smn_gip.smn_categoria_cargos.smn_categoria_cargos_id is not null  and smn_gip.smn_categoria_cargos.smn_categoria_cargos_id=smn_control_acceso.smn_personal.psl_categoria_cargo  order by smn_gip.smn_categoria_cargos.cat_nombre ) as psl_categoria_cargo_combo,
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
	smn_control_acceso.smn_personal.psl_categoria_cargo,
	smn_control_acceso.smn_personal.smn_personal_id
from 
	smn_control_acceso.smn_personal
order by 
	smn_control_acceso.smn_personal.smn_personal_id desc