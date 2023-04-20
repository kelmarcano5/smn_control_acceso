select	
	smn_turnos.tur_codigo,
	smn_turnos.tur_nombre,
	smn_turnos.tur_fecha_registro,
	smn_turnos.smn_turnos_id

from
	smn_turnos
where
	smn_turnos_id is not null	
 	 	${filter}
order by 
	smn_turnos_id