select smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id as id, 
smn_gip.smn_turnos.tur_codigo || ' - ' || smn_gip.smn_turnos.tur_nombre as item 
from smn_gip.smn_turnos, smn_gip.smn_esquema_rotacion 
where smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id = smn_gip.smn_turnos.smn_turnos_id 
order by smn_gip.smn_turnos.tur_nombre