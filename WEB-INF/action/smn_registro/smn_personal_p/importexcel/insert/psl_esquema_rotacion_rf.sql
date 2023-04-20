select
	COALESCE( 
		(select 
			smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id
		from
			smn_gip.smn_esquema_rotacion
		where
			upper(trim(smn_gip.smn_esquema_rotacion.ero_nombre))=upper(trim(${fld:psl_esquema_rotacion_rf_desc}))
	), 0) as psl_esquema_rotacion_rf_ref