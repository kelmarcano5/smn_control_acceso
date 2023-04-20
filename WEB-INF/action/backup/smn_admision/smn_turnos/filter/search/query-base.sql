select
	smn_control_acceso.smn_turnos.tur_codigo,
	smn_control_acceso.smn_turnos.tur_nombre,
	smn_control_acceso.smn_turnos.tur_fecha_registro,
	smn_control_acceso.smn_turnos.smn_turnos_id
from
	smn_control_acceso.smn_turnos
where
	smn_control_acceso.smn_turnos.smn_turnos_id is not null
and
   	smn_control_acceso.smn_turnos.tur_idioma = '${def:locale}'
and
	smn_control_acceso.smn_turnos.tur_usuario = '${def:user}'
	${filter}
order by
	smn_control_acceso.smn_turnos.smn_turnos_id desc
