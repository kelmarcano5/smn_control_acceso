select 
	smn_gip.smn_esquema_rotacion.ero_turno as id, 
	smn_control_acceso.smn_turnos.tur_codigo || ' - ' || smn_control_acceso.smn_turnos.tur_nombre as item 
from 
	smn_control_acceso.smn_turnos, 
	smn_gip.smn_esquema_rotacion 
where 
	smn_gip.smn_esquema_rotacion.ero_turno = smn_control_acceso.smn_turnos.smn_turnos_id 
order by 
	smn_control_acceso.smn_turnos.tur_nombre