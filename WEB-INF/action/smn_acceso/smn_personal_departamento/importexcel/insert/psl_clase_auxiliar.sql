select 
	COALESCE( 
		(select 
			smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id  
		 from   
			smn_base.smn_clase_auxiliar 
		 where  
			upper(smn_base.smn_clase_auxiliar.cla_nombre) = upper(${fld:psl_clase_auxiliar_desc})
		), 0) as psl_clase_auxiliar_ref
