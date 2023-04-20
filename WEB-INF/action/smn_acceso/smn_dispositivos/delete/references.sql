select 
	smn_base.smn_entidades.smn_entidades_id as refid 
from 
	smn_base.smn_entidades 
where 
	smn_base.smn_entidades.smn_entidades_id = ${fld:id}
union
select 
	smn_base.smn_sucursales.smn_sucursales_id as refid 
from 
	smn_base.smn_sucursales 
where 
	smn_base.smn_sucursales.smn_sucursales_id = ${fld:id}
union
select 
	smn_base.smn_areas_servicios.smn_areas_servicios_id as refid 
from 
	smn_base.smn_areas_servicios 
where 
	smn_base.smn_areas_servicios.smn_areas_servicios_id = ${fld:id}
union
select 
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id as refid 
from 
	smn_base.smn_unidades_servicios 
where 
	smn_base.smn_unidades_servicios.smn_unidades_servicios_id = ${fld:id}	

	
	
	