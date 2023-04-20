select
	case
	when smn_control_acceso.smn_transacciones.trn_tipo_marcaje='ENT' then '${lbl:b_in}'
	when smn_control_acceso.smn_transacciones.trn_tipo_marcaje='SAL' then '${lbl:b_out}'
	end as trn_tipo_marcaje_combo,
	smn_control_acceso.smn_transacciones.*
from
	smn_control_acceso.smn_transacciones
where
		smn_control_acceso.smn_transacciones.smn_transacciones_id = ${fld:id}
