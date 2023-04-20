select 
	trans_estatus.id,
	smn_control_acceso.smn_transacciones_desnorm.trd_sede,
	smn_control_acceso.smn_transacciones_desnorm.trd_dispositivo,
	smn_control_acceso.smn_transacciones_desnorm.trd_identificacion,
	smn_control_acceso.smn_transacciones_desnorm.trd_tipo_marcaje,
	smn_control_acceso.smn_transacciones_desnorm.trd_fecha_transaccion,
	smn_control_acceso.smn_transacciones_desnorm.trd_hora_transaccion,
	smn_control_acceso.smn_transacciones_desnorm.trd_tiempo_efectivo,
	smn_control_acceso.smn_transacciones_desnorm.trd_tiempo_efectivo_total,
	case 
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'ESC' then 'Correcto'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'FEN' then 'Faltan Entradas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'FSA' then 'Faltan Salidas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'SEN' then 'Sólo Entradas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'ESI' then 'Incorrecto'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'SSA' then 'Sólo Salidas'
		when smn_control_acceso.smn_transacciones_desnorm.trd_status = 'FES' then 'Faltan Entradas y Salidas'
	end as status
from
	smn_control_acceso.smn_transacciones_desnorm,
	(select 
		row_number() over() as id,
		smn_control_acceso.smn_transacciones_desnorm.trd_status as descripcion,
		count(*) as total
	 from
		smn_control_acceso.smn_transacciones_desnorm		
	 group by
		smn_control_acceso.smn_transacciones_desnorm.trd_status) trans_estatus
where
	smn_control_acceso.smn_transacciones_desnorm.trd_status = trans_estatus.descripcion
and
	trans_estatus.id = ${fld:id}