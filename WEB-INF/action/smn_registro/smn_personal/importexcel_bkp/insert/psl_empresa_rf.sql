select 
	smn_base.smn_entidades.smn_entidades_id as psl_empresa_rf_ref 
from   
	smn_base.smn_entidades 
where  
	upper(smn_base.smn_entidades.ent_descripcion_corta) = upper(${fld:psl_empresa_rf_desc})
