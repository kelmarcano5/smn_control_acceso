select 
	smn_base.smn_areas_servicios.smn_areas_servicios_id as mrk_area_servicio_ref 
from   
	smn_base.smn_areas_servicios 
where  
	upper(smn_base.smn_areas_servicios.ase_descripcion) = upper(${fld:mrk_area_servicio_desc})
