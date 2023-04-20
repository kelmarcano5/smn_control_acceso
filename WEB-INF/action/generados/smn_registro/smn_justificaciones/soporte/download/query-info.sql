select
	jsa_contenido as content_type, 
	jsa_archivo as filename,
	jsa_archivo as filenametemp
from smn_control_acceso.smn_justificaciones_soporte
where smn_justificaciones_soporte_id = ${fld:id}
