select
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	${field}
from
	smn_control_acceso.smn_dispositivos
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_dispositivos.dis_area_servicio
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_dispositivos.dis_empresa
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_dispositivos.dis_sucursal
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_dispositivos.dis_unidad_servicio
where
		smn_control_acceso.smn_dispositivos.smn_dispositivos_id = ${fld:id}
	
