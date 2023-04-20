select 
	COALESCE( 
		(select 
			smn_base.smn_unidades_servicios.smn_unidades_servicios_id  
		from   
			smn_base.smn_unidades_servicios 
		where  
			upper(smn_base.smn_unidades_servicios.uns_descripcion) = upper(${fld:dis_unidad_servicio_desc})
	), 0) as dis_unidad_servicio_ref
