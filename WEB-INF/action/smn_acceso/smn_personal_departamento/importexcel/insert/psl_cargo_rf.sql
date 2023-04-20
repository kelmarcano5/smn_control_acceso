select
	COALESCE( 
		(select 
			smn_gip.smn_cargos.smn_cargos_id
		from
			smn_gip.smn_cargos
		where
			upper(trim(smn_gip.smn_cargos.job_nombre))=upper(trim(${fld:psl_cargo_rf_desc}))
	), 0) as psl_cargo_rf_ref