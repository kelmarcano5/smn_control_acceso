select 
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id as mrk_unidad_servicio_rf_ref 
from   
	smn_base.smn_unidades_servicios 
where  
	upper(smn_base.smn_unidades_servicios.uns_descripcion) = upper(${fld:mrk_unidad_servicio_rf_desc})
