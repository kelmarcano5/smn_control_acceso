select 
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id as asi_auxiliar_rf_ref 
from   
	smn_base.smn_v_auxiliar 
where  
	upper(smn_base.smn_v_auxiliar.smn_item) = upper(${fld:asi_auxiliar_rf_desc})
