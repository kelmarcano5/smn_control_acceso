 and
 	(upper(smn_control_acceso.smn_transacciones_desnorm.trd_status) like upper(${fld:trd_status}) or
 	('ERROR' like upper(${fld:trd_status}) and 
 	 upper(smn_control_acceso.smn_transacciones_desnorm.trd_status) not like 'ESC'))