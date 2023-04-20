select
	COALESCE( 
		(select 
			smn_gip.smn_categoria_personal.smn_categoria_personal_id
		from
			smn_gip.smn_categoria_personal
		where
			upper(trim(smn_gip.smn_categoria_personal.cap_nombre))=upper(trim(${fld:psl_categoria_personal_rf_desc}))
	), 0) as psl_categoria_personal_rf_ref