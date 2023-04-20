select 
	smn_base.smn_sucursales.smn_sucursales_id as mrk_sucursal_rf_ref 
from   
	smn_base.smn_sucursales 
where  
	upper(smn_base.smn_sucursales.suc_nombre) = upper(${fld:mrk_sucursal_rf_desc})
