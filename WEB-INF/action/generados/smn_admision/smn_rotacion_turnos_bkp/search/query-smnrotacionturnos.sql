select
	case
		when smn_rotacion_turnos.rot_dia='DO' then '${lbl:b_sunday}'
		when smn_rotacion_turnos.rot_dia='LU' then '${lbl:b_monday}'
		when smn_rotacion_turnos.rot_dia='MA' then '${lbl:b_tuesday}'
		when smn_rotacion_turnos.rot_dia='MI' then '${lbl:b_wednesday}'
		when smn_rotacion_turnos.rot_dia='JU' then '${lbl:b_thursday}'
		when smn_rotacion_turnos.rot_dia='VI' then '${lbl:b_friday}'
		when smn_rotacion_turnos.rot_dia='SA' then '${lbl:b_saturday}'
	end as rot_dia_combo,
	smn_rotacion_turnos.rot_turno,
	smn_rotacion_turnos.rot_consecutivo,
	smn_rotacion_turnos.rot_dia,
	smn_rotacion_turnos.rot_horario,
	smn_rotacion_turnos.rot_fecha_registro

from 
	smn_rotacion_turnos
