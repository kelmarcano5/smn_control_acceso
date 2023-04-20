select	
	(select smn_base.smn_estructura_organizacional.eor_codigo || " - " || smn_base.smn_estructura_organizacional.eor_nombre from  smn_base.smn_estructura_organizacional  where smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id is not null  and smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_control_acceso.smn_personal.psl_estructura_organizacional_rf  order by smn_base.smn_estructura_organizacional.eor_nombre ) as psl_estructura_organizacional_rf_combo,
	(select smn_gip.smn_cargos.job_codigo|| " - " || smn_gip.smn_cargos.job_nombre from  smn_gip.smn_cargos  where smn_gip.smn_cargos.smn_cargos_id is not null  and smn_gip.smn_cargos.smn_cargos_id=smn_control_acceso.smn_personal.psl_cargo_rf  order by smn_gip.smn_cargos.job_nombre ) as psl_cargo_rf_combo,
	(select smn_gip.smn_categoria_cargos.cat_codigo || " - " || smn_gip.smn_categoria_cargos.cat_nombre from  smn_gip.smn_categoria_cargos  where smn_gip.smn_categoria_cargos.smn_categoria_cargos_id is not null  and smn_gip.smn_categoria_cargos.smn_categoria_cargos_id=smn_control_acceso.smn_personal.psl_categoria_cargo_rf  order by smn_gip.smn_categoria_cargos.cat_nombre ) as psl_categoria_cargo_rf_combo,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso_rf='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso_rf='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_rf_combo,
	(select smn_control_acceso.smn_turnos.tur_codigo || ' - ' || smn_control_acceso.smn_turnos.tur_nombre from  smn_control_acceso.smn_turnos, smn_gip.smn_esquema_rotacion where smn_gip.smn_esquema_rotacion.ero_turno = smn_control_acceso.smn_turnos.smn_turnos_id  and smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id=smn_control_acceso.smn_personal.psl_esquema_rotacion_rf  order by smn_control_acceso.smn_turnos.tur_nombre ) as psl_esquema_rotacion_rf_combo,
	(select smn_gip.smn_categoria_personal.cap_codigo || " - " || smn_gip.smn_categoria_personal.cap_nombre from  smn_gip.smn_categoria_personal  where smn_gip.smn_categoria_personal.smn_categoria_personal_id is not null  and smn_gip.smn_categoria_personal.smn_categoria_personal_id=smn_control_acceso.smn_personal.psl_categoria_personal_rf  order by smn_gip.smn_categoria_personal.cap_nombre ) as psl_categoria_personal_rf_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo || " - "|| smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_control_acceso.smn_personal.psl_clase_auxiliar_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as psl_clase_auxiliar_rf_combo,
	(select smn_base.smn_v_auxiliar.smn_codigo || " - " || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar_rf  order by smn_base.smn_v_auxiliar.smn_item ) as psl_auxiliar_rf_combo,
	(select smn_base.smn_entidades.ent_codigo|| " - "' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_control_acceso.smn_personal.psl_empresa_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as psl_empresa_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo || " - " || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_control_acceso.smn_personal.psl_sucursal_rf  order by smn_base.smn_sucursales.suc_nombre ) as psl_sucursal_rf_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || " - " || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_control_acceso.smn_personal.psl_area_servicio_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as psl_area_servicio_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo ||" - " || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_control_acceso.smn_personal.psl_unidad_servicio_rf  order by smn_base.smn_unidades_servicios.uns_descripcion ) as psl_unidad_servicio_rf_combo,
	(select smn_base.smn_centro_costo.cco_codigo || " - " || smn_base.smn_centro_costo.cco_descripcion_corta from  smn_base.smn_centro_costo  where smn_base.smn_centro_costo.smn_centro_costo_id is not null  and smn_base.smn_centro_costo.smn_centro_costo_id=smn_control_acceso.smn_personal.psl_centro_costo_rf  order by  smn_base.smn_centro_costo.cco_descripcion_corta ) as psl_centro_costo_rf_combo,
	smn_control_acceso.smn_personal.psl_estructura_organizacional_rf,
	smn_control_acceso.smn_personal.psl_cargo_rf,
	smn_control_acceso.smn_personal.psl_categoria_cargo_rf,
	smn_control_acceso.smn_personal.psl_habilita_acceso_rf,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_personal.psl_fecha_registro,
	smn_control_acceso.smn_personal.psl_num_control,
	smn_control_acceso.smn_personal.psl_esquema_rotacion_rf,
	smn_control_acceso.smn_personal.psl_fecha_inicio_calculo,
	smn_control_acceso.smn_personal.psl_categoria_personal_rf,
	smn_control_acceso.smn_personal.psl_clase_auxiliar_rf,
	smn_control_acceso.smn_personal.psl_auxiliar_rf,
	smn_control_acceso.smn_personal.psl_empresa_rf,
	smn_control_acceso.smn_personal.psl_sucursal_rf,
	smn_control_acceso.smn_personal.psl_area_servicio_rf,
	smn_control_acceso.smn_personal.psl_unidad_servicio_rf,
	smn_control_acceso.smn_personal.psl_centro_costo_rf,
	smn_control_acceso.smn_personal.smn_personal_id

from
	smn_control_acceso.smn_personal
where
	smn_personal_id is not null	
 	 	${filter}
order by 
	smn_personal_id