select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_auxiliar.aux_codigo||'-'|| smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cac_nombre,
	smn_gip.smn_cargos.job_nombre as job_nombre2,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_estructura_organizacional.eor_nombre,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	smn_control_acceso.smn_personal.smn_personal_id,
	smn_gip.smn_esquema_rotacion.ero_codigo ||' - '||smn_gip.smn_esquema_rotacion.ero_nombre as smn_esquema_rotacion_rf,
	smn_gip.smn_esquema_rotacion.ero_codigo as ero_codigo_pl0,
	smn_control_acceso.smn_personal.psl_num_control,
	smn_control_acceso.smn_personal.psl_clase_auxiliar_rf,
		case
		when smn_control_acceso.smn_personal.psl_habilita_acceso_rf='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso_rf='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_rf,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_personal.psl_auxiliar_rf,
	smn_control_acceso.smn_personal.psl_empresa_rf,
	smn_control_acceso.smn_personal.psl_cargo_rf,
	smn_base.smn_auxiliar.aux_codigo||'-'|| smn_base.smn_auxiliar.aux_descripcion as smn_item,
	smn_control_acceso.smn_personal.psl_fecha_registro,
	case
		when smn_control_acceso.smn_personal.psl_estatus='AC' then '${lbl:b_active}'
		when smn_control_acceso.smn_personal.psl_estatus='IN' then '${lbl:b_inactive}'
		when smn_control_acceso.smn_personal.psl_estatus='RP' then 'Reposo'
		when smn_control_acceso.smn_personal.psl_estatus='VC' then 'Vacaciones'
		when smn_control_acceso.smn_personal.psl_estatus='EG' then 'Egresado'
		when smn_control_acceso.smn_personal.psl_estatus='RE' then 'Registrado'
		when smn_control_acceso.smn_personal.psl_estatus='GE' then 'Generado'
	end as psl_estatus
				

from
	smn_control_acceso.smn_personal
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_personal.psl_area_servicio_rf
	left outer join smn_base.smn_naturaleza_auxiliar on smn_base.smn_naturaleza_auxiliar.smn_naturaleza_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_personal.psl_cargo_rf
	left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_personal.psl_categoria_cargo_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_personal.psl_centro_costo_rf
  	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_personal.psl_clase_auxiliar_rf
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_personal.psl_unidad_servicio_rf
	left outer join smn_gip.smn_esquema_rotacion on smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_control_acceso.smn_personal.psl_esquema_rotacion_rf
where
	smn_control_acceso.smn_personal.psl_estatus IN ('GE', 'RE')
order by
	smn_control_acceso.smn_personal.smn_personal_id desc