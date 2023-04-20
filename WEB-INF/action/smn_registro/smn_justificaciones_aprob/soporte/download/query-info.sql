select
	content_type as content_type, 
	filename as filename
from smn_control_acceso.smn_justificaciones_soporte
where smn_justificaciones_soporte_id = ${fld:id}
