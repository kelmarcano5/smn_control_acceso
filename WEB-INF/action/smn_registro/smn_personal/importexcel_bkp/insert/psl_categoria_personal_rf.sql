select 
	smn_gip.smn_categoria_personal.smn_categoria_personal_id as psl_categoria_personal_rf_ref 
from   
	smn_gip.smn_categoria_personal 
where  
	upper(smn_gip.smn_categoria_personal.cap_nombre) = upper(${fld:psl_categoria_personal_rf_desc})
