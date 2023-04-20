select
	COALESCE( 
		(select 
			smn_gip.smn_categoria_cargos.smn_categoria_cargos_id
		from
			smn_gip.smn_categoria_cargos
		where
			upper(trim(smn_gip.smn_categoria_cargos.cac_nombre))=upper(trim(${fld:psl_categoria_cargo_rf_desc}))
	), 0) as psl_categoria_cargo_rf_ref