select
		smn_gip.smn_control_esquema_rotacion.smn_personal_id,
	smn_gip.smn_control_esquema_rotacion.smn_esquema_rotacion_actual_rf,
	smn_gip.smn_control_esquema_rotacion.smn_esquema_rotacion_nuevo_rf,
	smn_gip.smn_control_esquema_rotacion.cer_fecha_vigencia,
	smn_gip.smn_control_esquema_rotacion.cer_fecha_registro
from
	smn_gip.smn_control_esquema_rotacion 
where
	smn_gip.smn_control_esquema_rotacion.smn_control_esquema_rotacion_id = ${fld:id}
