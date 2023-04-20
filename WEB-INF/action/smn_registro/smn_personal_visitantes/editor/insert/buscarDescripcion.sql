select smn_control_acceso.smn_personal_visitantes.smn_personal_id 
from smn_control_acceso.smn_personal_visitantes 
where smn_control_acceso.smn_personal_visitantes.smn_personal_id = ${fld:smn_personal_id} 
and smn_control_acceso.smn_personal_visitantes.rpv_fecha_evento>=${fld:rpv_fecha_evento} limit 1