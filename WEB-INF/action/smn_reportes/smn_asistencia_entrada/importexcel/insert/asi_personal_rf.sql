select 
	smn_control_acceso.smn_personal.smn_personal_id as asi_personal_rf_ref 
from   
	smn_control_acceso.smn_personal 
where  
	upper(smn_control_acceso.smn_personal.psl_id_control_acceso) = upper(${fld:asi_personal_rf_desc})
