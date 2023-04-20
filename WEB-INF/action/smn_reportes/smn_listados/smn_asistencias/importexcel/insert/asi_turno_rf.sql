select 
	smn_control_acceso.smn_turnos.smn_turnos_id as asi_turno_rf_ref 
from   
	smn_control_acceso.smn_turnos 
where  
	upper(smn_control_acceso.smn_turnos.tur_nombre) = upper(${fld:asi_turno_rf_desc})
