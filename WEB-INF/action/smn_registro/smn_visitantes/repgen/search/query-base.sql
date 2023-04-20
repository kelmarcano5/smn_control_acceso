select
		smn_control_acceso.smn_visitantes.smn_visitantes_id,
	${field}
from
	smn_control_acceso.smn_visitantes
where
		smn_control_acceso.smn_visitantes.smn_visitantes_id is not null
	${filter}
	
	
