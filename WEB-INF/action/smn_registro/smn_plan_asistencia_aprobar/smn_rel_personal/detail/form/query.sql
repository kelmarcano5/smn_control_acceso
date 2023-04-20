select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_v_auxiliar.smn_item,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cac_nombre,
	smn_gip.smn_categoria_personal.cap_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_estructura_organizacional.eor_nombre,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	case
	when smn_control_acceso.smn_personal.psl_habilita_acceso_rf='S' then '${lbl:b_yes}'
	when smn_control_acceso.smn_personal.psl_habilita_acceso_rf='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_rf,
	smn_control_acceso.smn_personal.*
from
	smn_base.smn_areas_servicios,
	smn_base.smn_v_auxiliar,
	smn_gip.smn_cargos,
	smn_gip.smn_categoria_cargos,
	smn_gip.smn_categoria_personal,
	smn_base.smn_centro_costo,
	smn_base.smn_clase_auxiliar,
	smn_base.smn_entidades,
	smn_base.smn_estructura_organizacional,
	smn_base.smn_sucursales,
	smn_base.smn_unidades_servicios,
	smn_control_acceso.smn_personal
where
	smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_personal.psl_area_servicio_rf and
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf and
	smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_personal.psl_cargo_rf and
	smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_personal.psl_categoria_cargo_rf and
	smn_gip.smn_categoria_personal.smn_categoria_personal_id = smn_control_acceso.smn_personal.psl_categoria_personal_rf and
	smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_personal.psl_centro_costo_rf and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar_rf and
	smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf and
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf and
	smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf and
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_personal.psl_unidad_servicio_rf and
	smn_personal_id = ${fld:id}
