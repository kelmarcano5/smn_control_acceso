select
	COALESCE( 
		(select 
			smn_base.smn_v_auxiliar.smn_v_auxiliar_id
		from
			smn_base.smn_v_auxiliar
		where
			upper(trim(smn_base.smn_v_auxiliar.smn_item))=upper(trim(${fld:psl_auxiliar_rf_desc}))
		limit 1
	), 0) as psl_auxiliar_rf_ref