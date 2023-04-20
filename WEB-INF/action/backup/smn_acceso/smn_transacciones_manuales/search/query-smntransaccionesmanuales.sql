select
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id,
	case
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='EN' then '${lbl:b_in}'
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='SA' then '${lbl:b_out}'
		when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='ES' then '${lbl:b_entry_exit}'
	end as trm_tipo_marcaje_combo,
	smn_control_acceso.smn_transacciones_manuales.trm_sede,
	smn_control_acceso.smn_transacciones_manuales.trm_identificacion,
	smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje,
	smn_control_acceso.smn_transacciones_manuales.trm_jutificacion,
	smn_control_acceso.smn_transacciones_manuales.trm_fecha_transaccion,
	smn_control_acceso.smn_transacciones_manuales.trm_hora_transaccion,
	smn_control_acceso.smn_transacciones_manuales.trm_fecha_registro
from
	smn_control_acceso.smn_transacciones_manuales
order by
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id desc
