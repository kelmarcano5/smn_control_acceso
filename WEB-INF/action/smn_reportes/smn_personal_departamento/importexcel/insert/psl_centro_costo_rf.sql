select
	COALESCE( 
		(select 
			smn_base.smn_centro_costo.smn_centro_costo_id
		from
			smn_base.smn_centro_costo
		where
			upper(trim(smn_base.smn_centro_costo.cco_descripcion_corta))=upper(trim(${fld:psl_centro_costo_rf_desc}))
	), 0) as psl_centro_costo_rf_ref