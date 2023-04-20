select
	smn_base.smn_centro_costo.smn_centro_costo_id,
	smn_base.smn_centro_costo.cco_codigo || ' - ' || smn_base.smn_centro_costo.cco_descripcion_corta as item	
from
	smn_base.smn_centro_costo
where	
	smn_base.smn_centro_costo.cco_empresa = (select
													smn_base.smn_entidades.smn_entidades_id
											 from 
													smn_base.smn_entidades
											 where
													upper(smn_base.smn_entidades.ent_descripcion_corta)=upper(${fld:id}))
and
	smn_base.smn_centro_costo.cco_sucursal = (select
													smn_base.smn_sucursales.smn_sucursales_id
											  from 
													smn_base.smn_sucursales
											  where
													upper(smn_base.smn_sucursales.suc_nombre)=upper(${fld:id2}))
and
	smn_base.smn_centro_costo.cco_area_servicio = (select
														smn_base.smn_areas_servicios.smn_areas_servicios_id
												   from
														smn_base.smn_areas_servicios
												   where
														upper(smn_base.smn_areas_servicios.ase_descripcion) = upper(${fld:id3}))
and
	smn_base.smn_centro_costo.cco_unidad_servicio = (select
														smn_base.smn_unidades_servicios.smn_unidades_servicios_id
													from 
														smn_base.smn_unidades_servicios
													where
														upper(smn_base.smn_unidades_servicios.uns_descripcion) = upper(${fld:id4}))



	
	
	

	
