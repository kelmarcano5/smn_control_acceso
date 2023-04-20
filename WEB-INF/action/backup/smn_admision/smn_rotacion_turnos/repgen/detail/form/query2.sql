select
	case
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='DO' then '${lbl:b_sunday}'
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='LU' then '${lbl:b_monday}'
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='MA' then '${lbl:b_tuesday}'
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='MI' then '${lbl:b_wednesday}'
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='JU' then '${lbl:b_thursday}'
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='VI' then '${lbl:b_friday}'
		when smn_control_acceso.smn_rotacion_turnos.rot_dia='SA' then '${lbl:b_saturday}'
	end as rot_dia_combo,
	case
		when ${fld:rot_dia_filter}='DO' then '${lbl:b_sunday}'
		when ${fld:rot_dia_filter}='LU' then '${lbl:b_monday}'
		when ${fld:rot_dia_filter}='MA' then '${lbl:b_tuesday}'
		when ${fld:rot_dia_filter}='MI' then '${lbl:b_wednesday}'
		when ${fld:rot_dia_filter}='JU' then '${lbl:b_thursday}'
		when ${fld:rot_dia_filter}='VI' then '${lbl:b_friday}'
		when ${fld:rot_dia_filter}='SA' then '${lbl:b_saturday}'
	end as rot_dia_combo_filter,
	smn_control_acceso.smn_rotacion_turnos.*
from
	smn_control_acceso.smn_rotacion_turnos
where
	smn_control_acceso.smn_rotacion_turnos.smn_rotacion_turnos_id = ${fld:id}
