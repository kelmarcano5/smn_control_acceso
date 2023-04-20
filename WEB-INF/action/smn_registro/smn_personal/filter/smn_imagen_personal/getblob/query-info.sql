select
	content_type as content_type, 
	filename as filename,
	filenametemp as filenametemp
from smn_control_acceso.smn_imagen_personal
where smn_imagen_personal_id = ${fld:id}
