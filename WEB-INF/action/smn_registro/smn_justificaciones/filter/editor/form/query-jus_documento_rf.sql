select 
	smn_gip.smn_documentos.smn_documentos_id as id, 
	smn_gip.smn_documentos.dcm_codigo|| ' - ' || smn_gip.smn_documentos.dcm_descripcion as item 
from 
	smn_gip.smn_documentos 
	--LEFT JOIN smn_base.smn_documentos_generales on smn_gip.smn_documentos.smn_documentos_generales_rf = smn_base.smn_documentos_generales.smn_documentos_generales_id
--where 
	--smn_gip.smn_documentos.smn_documentos_generales_rf=22
