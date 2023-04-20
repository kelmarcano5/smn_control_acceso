select
	case
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='EN' then '${lbl:b_in}'
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='SA' then '${lbl:b_out}'
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='ES' then '${lbl:b_entry_exit}'
	end as trm_tipo_marcaje_combo,
	smn_control_acceso.smn_transacciones_manuales.*
from
	smn_control_acceso.smn_transacciones_manuales
where
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id = ${fld:id}
