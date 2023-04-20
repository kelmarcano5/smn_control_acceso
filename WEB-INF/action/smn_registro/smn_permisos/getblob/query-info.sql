select
	spe_contenido as content_type, 
	spe_archivo as filename
from smn_control_acceso.smn_solicitud_permisos
where smn_solicitud_permisos_id = ${fld:id}
