select 
	smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id as spe_categoria_justif_rf_ref 
from   
	smn_gip.smn_categoria_justificaciones 
where  
	upper(smn_gip.smn_categoria_justificaciones.cju_nombre) = upper(${fld:spe_categoria_justif_rf_desc})
