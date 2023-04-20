select
	smn_control_acceso.smn_visitantes.*
from
	smn_control_acceso.smn_visitantes
where
	smn_visitantes_id = ${fld:id}
