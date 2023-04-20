select
	COALESCE( 
		(select 
			smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
		from
			smn_base.smn_estructura_organizacional
		where
			upper(trim(smn_base.smn_estructura_organizacional.eor_nombre))=upper(trim(${fld:psl_estructura_organizacional_rf_desc}))
	), 0) as psl_estructura_organizacional_rf_ref