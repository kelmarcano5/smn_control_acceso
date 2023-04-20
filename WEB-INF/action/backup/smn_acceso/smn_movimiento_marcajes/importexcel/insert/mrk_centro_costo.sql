select 
	smn_base.smn_centro_costo.smn_centro_costo_id as mrk_centro_costo_ref 
from   
	smn_base.smn_centro_costo 
where  
	upper(smn_base.smn_centro_costo.cco_descripcion_corta) = upper(${fld:mrk_centro_costo_desc})
