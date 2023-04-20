select
	content_type as content_type, 
	filename as filename
from smn_control_acceso.smn_permisos_soporte
where smn_permisos_soporte_id = ${fld:id}
