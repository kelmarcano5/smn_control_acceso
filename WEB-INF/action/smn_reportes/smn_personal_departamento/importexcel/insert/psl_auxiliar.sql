select 
	COALESCE( 
		(select 
			smn_base.smn_v_auxiliar.smn_v_auxiliar_id  
		 from   
			smn_base.smn_v_auxiliar 
		 where  
			upper(smn_base.smn_v_auxiliar.smn_item) = upper(${fld:psl_auxiliar_desc})
		), 0) as psl_auxiliar_ref
