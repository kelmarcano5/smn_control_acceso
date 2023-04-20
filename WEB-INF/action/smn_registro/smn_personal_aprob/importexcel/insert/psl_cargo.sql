select 
	COALESCE( 
		(select 
			smn_gip.smn_cargos.smn_cargos_id  
		 from   
			smn_gip.smn_cargos 
		 where  
			upper(smn_gip.smn_cargos.job_nombre) = upper(${fld:psl_cargo_desc})
		), 0) as psl_cargo_ref
