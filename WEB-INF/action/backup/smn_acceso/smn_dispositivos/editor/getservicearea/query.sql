select
	smn_base.smn_areas_servicios.smn_areas_servicios_id,
	smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion as item
from
	smn_base.smn_areas_servicios
where
	smn_base.smn_areas_servicios.ase_empresa = (select
														smn_base.smn_entidades.smn_entidades_id
									              from 
									                    smn_base.smn_entidades
									              where
									                    upper(smn_base.smn_entidades.ent_descripcion_corta)=upper(${fld:id}))
and
	(smn_base.smn_areas_servicios.ase_sucursal = (select
														smn_base.smn_sucursales.smn_sucursales_id
									              from 
									                    smn_base.smn_sucursales
									              where
									                    upper(smn_base.smn_sucursales.suc_nombre)=upper(${fld:id2}))
or
	smn_base.smn_areas_servicios.ase_sucursal is null)


	
	
	

	
