select 
	smn_gip.smn_documentos.smn_documentos_id as jus_documento_rf_ref 
from   
	smn_gip.smn_documentos 
where  
	upper(smn_gip.smn_documentos.dcm_nombre) = upper(${fld:jus_documento_rf_desc})
