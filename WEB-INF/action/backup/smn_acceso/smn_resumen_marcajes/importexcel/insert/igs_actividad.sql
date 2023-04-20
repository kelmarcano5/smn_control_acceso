select 
	smn_gip.smn_tipo_actividades.smn_tipo_actividades_id as igs_actividad_ref 
from   
	smn_gip.smn_tipo_actividades 
where  
	upper(smn_gip.smn_tipo_actividades.tya_nombre item) = upper(${fld:igs_actividad_desc})
