select
	COALESCE( 
		(select 
			smn_base.smn_areas_servicios.smn_areas_servicios_id
		from
			smn_base.smn_areas_servicios
		where
			upper(trim(smn_base.smn_areas_servicios.ase_descripcion))=upper(trim(${fld:psl_area_servicio_rf_desc}))
	), 0) as psl_area_servicio_rf_ref