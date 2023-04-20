select 
	COALESCE( 
		(select 
			smn_base.smn_sucursales.smn_sucursales_id 
		from   
			smn_base.smn_sucursales 
		where  
			upper(smn_base.smn_sucursales.suc_nombre) = upper(${fld:dis_sucursal_desc})
	), 0) as dis_sucursal_ref