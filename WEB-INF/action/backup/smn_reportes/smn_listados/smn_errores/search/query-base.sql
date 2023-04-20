select 
	tipos_estatus.id as id, 
	case 
		when tipos_estatus.descripcion = 'ESC' then 'Correcto'
		when tipos_estatus.descripcion = 'FEN' then 'Faltan Entradas'
		when tipos_estatus.descripcion = 'FSA' then 'Faltan Salidas'
		when tipos_estatus.descripcion = 'SEN' then 'Sólo Entradas'
		when tipos_estatus.descripcion = 'ESI' then 'Incorrecto'
		when tipos_estatus.descripcion = 'SSA' then 'Sólo Salidas'
		when tipos_estatus.descripcion = 'FES' then 'Faltan Entradas y Salidas'
	end as item, 
	count(*) as subtotal 
from 
	smn_control_acceso.smn_transacciones_desnorm as transacc,
	(select 
		row_number() over() as id, 
		transacc_intern.descripcion
	 from 
		(select 
			smn_control_acceso.smn_transacciones_desnorm.trd_status as descripcion,
			count(*) as total
		 from
			smn_control_acceso.smn_transacciones_desnorm
		 group by
			smn_control_acceso.smn_transacciones_desnorm.trd_status) transacc_intern
	) as tipos_estatus
where 
	tipos_estatus.descripcion = transacc.trd_status
	${filter}
group by
	tipos_estatus.id, 
	tipos_estatus.descripcion
order by 
	subtotal desc
	