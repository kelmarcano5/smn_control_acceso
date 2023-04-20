select 
	smn_base.smn_centro_costo.smn_centro_costo_id as psl_centro_costo_rf_ref 
from   
	smn_base.smn_centro_costo 
where  
	upper(smn_base.smn_centro_costo.cco_descripcion_corta) = upper(${fld:psl_centro_costo_rf_desc})
