select
	smn_control_acceso.smn_turnos.*
from
	smn_control_acceso.smn_turnos
where
		smn_control_acceso.smn_turnos.smn_turnos_id = ${fld:id}
