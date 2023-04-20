select
	(select
		smn_base.smn_areas_servicios.ase_descripcion
	 from 
	 	smn_base.smn_areas_servicios
	 where 
	 	smn_base.smn_areas_servicios.smn_areas_servicios_id = ${fld:dis_area_servicio_filter}) as ase_descripcion_filter,
	(select
		smn_base.smn_entidades.ent_descripcion_corta
	 from 
	 	smn_base.smn_entidades
	 where 
	 	smn_base.smn_entidades.smn_entidades_id = ${fld:dis_empresa_filter}) as ent_descripcion_corta_filter,
	(select
		smn_base.smn_sucursales.suc_nombre
	 from 
	 	smn_base.smn_sucursales
	 where 
	 	smn_base.smn_sucursales.smn_sucursales_id = ${fld:dis_sucursal_filter}) as suc_nombre_filter,
	smn_base.smn_areas_servicios.ase_descripcion,
	smn_base.smn_entidades.ent_descripcion_corta,
	smn_base.smn_sucursales.suc_nombre,
	smn_base.smn_unidades_servicios.uns_descripcion,
	case
		when smn_control_acceso.smn_dispositivos.dis_tipo_dispositivo='EN' then '${lbl:b_entry}'
		when smn_control_acceso.smn_dispositivos.dis_tipo_dispositivo='SA' then '${lbl:b_exit}'
		when smn_control_acceso.smn_dispositivos.dis_tipo_dispositivo='ES' then '${lbl:b_entry_exit}'
	end as dis_tipo_dispositivo_combo,
	smn_control_acceso.smn_dispositivos.*
from
	smn_control_acceso.smn_dispositivos
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_dispositivos.dis_area_servicio
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_dispositivos.dis_empresa
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_dispositivos.dis_sucursal
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_dispositivos.dis_unidad_servicio
where
	smn_control_acceso.smn_dispositivos.smn_dispositivos_id = ${fld:id}
