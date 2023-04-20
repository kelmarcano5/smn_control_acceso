select
	pma_imagen_data as image_data
from smn_control_acceso.smn_permisos_soporte
where smn_permisos_soporte_id = ${fld:id}
