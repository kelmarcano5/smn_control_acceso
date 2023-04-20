select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_v_auxiliar.smn_item,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cat_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_estructura_organizacional.eor_nombre,
	smn_control_acceso.smn_turnos.tur_nombre,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
		smn_control_acceso.smn_personal.smn_personal_id,
select
		smn_control_acceso.smn_personal.smn_personal_id,
select
		smn_control_acceso.smn_personal.smn_personal_id,
select
		smn_control_acceso.smn_personal.smn_personal_id,
select
		smn_control_acceso.smn_personal.smn_personal_id,
	case
	when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
	when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_personal.psl_auxiliar,
	smn_control_acceso.smn_personal.psl_empresa,
	smn_control_acceso.smn_personal.psl_sucursal,
	smn_control_acceso.smn_personal.psl_cargo,
	smn_control_acceso.smn_personal.psl_habilita_acceso,
	smn_control_acceso.smn_personal.psl_fecha_registro
	
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
	inner join smn_control_acceso.smn_turnos, on smn_control_acceso.smn_turnos,.smn_turnos,_id = smn_control_acceso.smn_personal.psl_grupo
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_personal.psl_unidad_servicio
