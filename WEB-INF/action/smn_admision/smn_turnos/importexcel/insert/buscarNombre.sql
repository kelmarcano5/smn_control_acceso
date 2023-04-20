select
		smn_control_acceso.smn_turnos.tur_nombre
from
		smn_control_acceso.smn_turnos
where
		upper(smn_control_acceso.smn_turnos.tur_nombre) = upper(${fld:tur_nombre})
