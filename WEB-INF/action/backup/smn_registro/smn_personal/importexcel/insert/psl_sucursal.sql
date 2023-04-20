select 
	smn_base.smn_sucursales.smn_sucursales_id as psl_sucursal_ref 
from   
	smn_base.smn_sucursales 
where  
	upper(smn_base.smn_sucursales.suc_nombre) = upper(${fld:psl_sucursal_desc})
