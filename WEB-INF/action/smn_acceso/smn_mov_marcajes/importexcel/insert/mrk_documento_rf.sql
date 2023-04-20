select 
	smn_gip.smn_documentos.smn_documentos_id as mrk_documento_rf_ref 
from   
	smn_gip.smn_documentos 
where  
	upper(smn_gip.smn_documentos.dcm_nombre) = upper(${fld:mrk_documento_rf_desc})
