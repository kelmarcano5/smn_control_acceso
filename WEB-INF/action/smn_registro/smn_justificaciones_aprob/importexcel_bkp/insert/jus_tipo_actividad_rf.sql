select 
	smn_gip.smn_tipo_actividades.smn_tipo_actividades_id as jus_tipo_actividad_rf_ref 
from   
	smn_gip.smn_tipo_actividades 
where  
	upper(smn_gip.smn_tipo_actividades.tya_nombre) = upper(${fld:jus_tipo_actividad_rf_desc})
