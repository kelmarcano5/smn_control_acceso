select 
	COALESCE( 
		(select 
			smn_base.smn_entidades.smn_entidades_id  
		from   
			smn_base.smn_entidades 
		where  
			upper(smn_base.smn_entidades.ent_descripcion_corta) = upper(${fld:dis_empresa_desc})
	), 0) as dis_empresa_ref