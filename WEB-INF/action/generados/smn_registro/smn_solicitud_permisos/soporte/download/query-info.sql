select
	pma_contenido as content_type, 
	pma_archivo as filename,
	pma_archivo as filenametemp
from smn_control_acceso.smn_permisos_soporte
where smn_permisos_soporte_id = ${fld:id}
