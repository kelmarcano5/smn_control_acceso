select
	jus_datos_imagen as image_data
from smn_control_acceso.smn_justificaciones
where smn_justificaciones_id = ${fld:id}
