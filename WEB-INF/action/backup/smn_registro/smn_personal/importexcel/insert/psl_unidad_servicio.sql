select 
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id as psl_unidad_servicio_ref 
from   
	smn_base.smn_unidades_servicios 
where  
	upper(smn_base.smn_unidades_servicios.uns_descripcion) = upper(${fld:psl_unidad_servicio_desc})
