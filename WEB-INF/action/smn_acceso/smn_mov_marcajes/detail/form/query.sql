select
	smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id,
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_gip.smn_cargos.job_nombre,
	smn_gip.smn_categoria_cargos.cac_nombre,
	smn_base.smn_centro_costo.cco_descripcion_corta,
	smn_gip.smn_documentos.smn_documentos_generales_rf as dcm_nombre,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	case
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='do' then 'Domingo'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='lu' then 'Lunes'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='ma' then 'Martes'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='mi' then 'Miércoles'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='ju' then 'Jueves'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='vi' then 'Viernes'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_dia='sa' then 'Sábado'
	end as mrk_marcaje_dia_rf_combo,
	case
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf='ENT' then 'Entrada'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf='SAL' then 'Salida'
	when smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf='ESL' then 'Entrada - Salida'
	end as mrk_marcaje_tipo_rf_combo,
	smn_control_acceso.smn_mov_marcajes.*,
	smn_base.smn_auxiliar.aux_descripcion as smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
		smn_base.smn_sucursales.suc_nombre as mrk_sede,
	smn_control_acceso.smn_mov_marcajes.smn_transaccion_id as mrk_transaccion_rf,
	smn_gip.smn_turnos.tur_codigo||' - '||smn_gip.smn_turnos.tur_nombre as mrk_turno_rf
	
	 
from
	smn_control_acceso.smn_mov_marcajes
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_area_rf
	left outer join smn_gip.smn_cargos on smn_gip.smn_cargos.smn_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_cargo_rf
	left outer join smn_gip.smn_categoria_cargos on smn_gip.smn_categoria_cargos.smn_categoria_cargos_id = smn_control_acceso.smn_mov_marcajes.smn_categoria_cargo_rf
	left outer join smn_base.smn_centro_costo on smn_base.smn_centro_costo.smn_centro_costo_id = smn_control_acceso.smn_mov_marcajes.smn_centro_costo_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_mov_marcajes.smn_documento_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_mov_marcajes.smn_sucursal_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_mov_marcajes.smn_unidad_servicio_rf
	left outer join smn_gip.smn_dispositivos on smn_gip.smn_dispositivos.smn_dispositivos_id = smn_control_acceso.smn_mov_marcajes.mrk_dispositivo_codigo
	left outer join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_mov_marcajes.smn_personal_rf
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar.smn_clase_auxiliar_rf
	left outer join smn_gip.smn_turnos on smn_gip.smn_turnos.smn_turnos_id = smn_control_acceso.smn_mov_marcajes.mrk_turno_rf
where
	smn_mov_marcajes_id = ${fld:id}
