select 
	smn_base.smn_areas_servicios.smn_areas_servicios_id as psl_area_servicio_rf_ref 
from   
	smn_base.smn_areas_servicios 
where  
	upper(smn_base.smn_areas_servicios.ase_descripcion) = upper(${fld:psl_area_servicio_rf_desc})
