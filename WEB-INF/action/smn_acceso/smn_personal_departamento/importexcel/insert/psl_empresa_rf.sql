select
	COALESCE( 
		(select 
			smn_base.smn_entidades.smn_entidades_id
		from
			smn_base.smn_entidades
		where
			upper(trim(smn_base.smn_entidades.ent_descripcion_corta))=upper(trim(${fld:psl_empresa_rf_desc}))
	), 0) as psl_empresa_rf_ref