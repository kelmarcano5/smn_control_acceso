select
	smn_control_acceso.smn_transacciones.smn_transacciones_id,
	${field}
from
	smn_control_acceso.smn_transacciones
where
	smn_control_acceso.smn_transacciones.smn_transacciones_id is not null
and
   	smn_control_acceso.smn_transacciones.trn_idioma = '${def:locale}'
and
	smn_control_acceso.smn_transacciones.trn_usuario = '${def:user}'
	${filter}
	
	
