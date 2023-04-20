select 
	smn_gip.smn_turnos,.smn_turnos,_id as psl_esquema_rotacion_rf_ref 
from   
	smn_gip.smn_turnos, 
where  
	upper(smn_gip.smn_turnos.tur_nombre) = upper(${fld:psl_esquema_rotacion_rf_desc})
