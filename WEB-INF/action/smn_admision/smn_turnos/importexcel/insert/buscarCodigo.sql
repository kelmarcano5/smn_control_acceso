select
		smn_control_acceso.smn_turnos.tur_codigo
from
		smn_control_acceso.smn_turnos
where
		upper(smn_control_acceso.smn_turnos.tur_codigo) = upper(${fld:tur_codigo})
