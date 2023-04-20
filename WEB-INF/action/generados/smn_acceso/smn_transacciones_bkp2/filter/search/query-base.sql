select	
	smn_control_acceso.smn_transacciones.trn_dispositivo,
	smn_control_acceso.smn_transacciones.trn_identificacion,
	smn_control_acceso.smn_transacciones.trn_fecha_transaccion,
	smn_control_acceso.smn_transacciones.trn_hora_transaccion,
	smn_control_acceso.smn_transacciones.trn_fecha_registro,
	smn_control_acceso.smn_transacciones.smn_transacciones_id
from
	smn_control_acceso.smn_transacciones
where
	smn_control_acceso.smn_transacciones.smn_transacciones_id is not null	
 	${filter}
order by 
	smn_control_acceso.smn_transacciones.smn_transacciones_id desc