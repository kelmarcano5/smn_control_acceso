select 
	smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id as asi_esquema_rotacion_rf_ref 
from   
	smn_gip.smn_esquema_rotacion 
where  
	upper(smn_gip.smn_esquema_rotacion.ero_nombre) = upper(${fld:asi_esquema_rotacion_rf_desc})
