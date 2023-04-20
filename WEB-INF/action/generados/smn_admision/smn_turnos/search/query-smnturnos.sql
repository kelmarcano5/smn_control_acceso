select
	smn_control_acceso.smn_turnos.tur_codigo,
	smn_control_acceso.smn_turnos.tur_nombre,
	smn_control_acceso.smn_turnos.tur_fecha_registro
from 
	smn_control_acceso.smn_turnos
order by 
	smn_control_acceso.smn_turnos.smn_turnos_id desc