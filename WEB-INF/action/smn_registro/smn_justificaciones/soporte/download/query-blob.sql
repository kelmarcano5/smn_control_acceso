select
	jsa_imagen_data as image_data
from smn_control_acceso.smn_justificaciones_soporte
where smn_justificaciones_soporte_id = ${fld:id}
