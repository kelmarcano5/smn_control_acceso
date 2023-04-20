delete from 
	smn_control_acceso.smn_dispositivos 
where 
	smn_control_acceso.smn_dispositivos.smn_dispositivos_id = ${fld:id}
and
	${fld:refid} is NULL

