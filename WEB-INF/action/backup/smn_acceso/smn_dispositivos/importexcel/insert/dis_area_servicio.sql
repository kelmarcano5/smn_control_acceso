select 
	COALESCE( 
		(select 
			smn_base.smn_areas_servicios.smn_areas_servicios_id  
		from   
			smn_base.smn_areas_servicios 
		where  
			upper(smn_base.smn_areas_servicios.ase_descripcion) = upper(${fld:dis_area_servicio_desc})
	), 0) as dis_area_servicio_ref