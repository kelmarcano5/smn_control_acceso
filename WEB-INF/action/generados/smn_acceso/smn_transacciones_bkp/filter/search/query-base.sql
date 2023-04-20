select	
	smn_transacciones.trn_dispositivo,
	smn_transacciones.trn_identificacion,
	smn_transacciones.trn_fecha_transaccion,
	smn_transacciones.trn_hora_transaccion,
	smn_transacciones.trn_fecha_registro,
	smn_transacciones.smn_transacciones_id

from
	smn_transacciones
where
	smn_transacciones_id is not null	
 	 	${filter}
order by 
	smn_transacciones_id