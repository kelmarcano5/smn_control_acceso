select 
	smn_gip.smn_documentos.smn_documentos_id as id, 
	smn_base.smn_documentos_generales.dcg_codigo|| ' - '  || smn_base.smn_documentos_generales.dcg_descripcion as item 
from 
	smn_gip.smn_documentos 
	inner join smn_base.smn_documentos_generales on smn_gip.smn_documentos.smn_documentos_generales_rf = smn_base.smn_documentos_generales.smn_documentos_generales_id
order by 
	smn_base.smn_documentos_generales.dcg_descripcion