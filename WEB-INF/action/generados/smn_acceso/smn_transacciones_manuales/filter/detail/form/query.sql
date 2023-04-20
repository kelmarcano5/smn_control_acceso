select
	case
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='ENT' then '${lbl:b_in}'
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='SAL' then '${lbl:b_out}'
	end as trm_tipo_marcaje_combo,
	smn_control_acceso.smn_transacciones_manuales.*
from 
	smn_control_acceso.smn_transacciones_manuales
where
	smn_transacciones_manuales_id = ${fld:id}
