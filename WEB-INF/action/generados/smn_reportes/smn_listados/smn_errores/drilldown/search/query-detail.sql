select 
	trans_estatus.id,
	smn_control_acceso.smn_transacciones_desnorm.trd_status as descripcion
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
	trans_estatus.id = ${id}