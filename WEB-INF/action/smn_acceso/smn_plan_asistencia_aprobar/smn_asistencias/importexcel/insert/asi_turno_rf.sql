select 
	smn_gip.smn_turnos.smn_turnos_id as asi_turno_rf_ref 
from   
	smn_gip.smn_turnos 
where  
	upper(smn_gip.smn_turnos.tur_nombre) = upper(${fld:asi_turno_rf_desc})
