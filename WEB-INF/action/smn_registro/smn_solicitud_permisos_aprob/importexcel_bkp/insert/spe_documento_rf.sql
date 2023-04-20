select 
	smn_gip.smn_documentos.smn_documentos_id as spe_documento_rf_ref 
from   
	smn_gip.smn_documentos 
where  
	upper(smn_gip.smn_documentos.dcm_nombre) = upper(${fld:spe_documento_rf_desc})
