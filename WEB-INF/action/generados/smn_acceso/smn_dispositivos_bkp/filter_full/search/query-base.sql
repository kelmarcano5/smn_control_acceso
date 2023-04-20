select	
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_dispositivos.dis_empresa  order by smn_base.smn_entidades.ent_descripcion_corta ) as dis_empresa_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_dispositivos.dis_sucursal  order by smn_base.smn_sucursales.suc_nombre ) as dis_sucursal_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_dispositivos.dis_area_servicio  order by smn_base.smn_areas_servicios.ase_descripcion ) as dis_area_servicio_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_dispositivos.dis_unidad_servicio  order by smn_base.smn_unidades_servicios.uns_descripcion ) as dis_unidad_servicio_combo,
	case
		when smn_dispositivos.dis_tipo_dispositivo='EN' then '${lbl:b_entry}'
		when smn_dispositivos.dis_tipo_dispositivo='SA' then '${lbl:b_exit}'
		when smn_dispositivos.dis_tipo_dispositivo='ES' then '${lbl:b_entry_exit}'
	end as dis_tipo_dispositivo_combo,
	smn_dispositivos.dis_codigo,
	smn_dispositivos.dis_nombre,
	smn_dispositivos.dis_empresa,
	smn_dispositivos.dis_sucursal,
	smn_dispositivos.dis_area_servicio,
	smn_dispositivos.dis_unidad_servicio,
	smn_dispositivos.dis_tipo_dispositivo,
	smn_dispositivos.dis_serial,
	smn_dispositivos.dis_ip_address,
	smn_dispositivos.dis_fecha_registro,
	smn_dispositivos.smn_dispositivos_id

from
	smn_dispositivos
where
	smn_dispositivos_id is not null	
 	 	${filter}
order by 
	smn_dispositivos_id