select
	jus_contenido as content_type, 
	jus_archivo as filename
from smn_control_acceso.smn_justificaciones
where smn_justificaciones_id = ${fld:id}
