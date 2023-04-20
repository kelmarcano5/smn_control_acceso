select
	smn_control_acceso.smn_turnos.smn_turnos_id,
	${field}
from
	smn_control_acceso.smn_turnos
where
	smn_control_acceso.smn_turnos.smn_turnos_id is not null
and
   	smn_control_acceso.smn_turnos.tur_idioma = '${def:locale}'
and
	smn_control_acceso.smn_turnos.tur_usuario = '${def:user}'
	${filter}
	
	
