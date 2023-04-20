select 
	COALESCE( 
		(select 
			smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id  
		 from   
			smn_base.smn_estructura_organizacional 
		 where  
			upper(smn_base.smn_estructura_organizacional.eor_nombre) = upper(${fld:psl_estructura_organiz_desc})
		), 0) as psl_estructura_organiz_ref