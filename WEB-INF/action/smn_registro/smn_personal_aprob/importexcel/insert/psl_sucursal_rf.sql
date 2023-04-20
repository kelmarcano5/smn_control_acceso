select
	COALESCE( 
		(select 
			smn_base.smn_sucursales.smn_sucursales_id
		from
			smn_base.smn_sucursales
		where
			upper(trim(smn_base.smn_sucursales.suc_nombre))=upper(trim(${fld:psl_sucursal_rf_desc}))
	), 0) as psl_sucursal_rf_ref