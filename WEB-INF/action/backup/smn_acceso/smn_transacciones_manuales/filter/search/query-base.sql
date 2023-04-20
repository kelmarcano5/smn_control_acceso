select
	case
	when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='ENT' then '${lbl:b_in}'
	when smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje='SAL' then '${lbl:b_out}'
	end as trm_tipo_marcaje_combo,
	smn_control_acceso.smn_transacciones_manuales.trm_sede,
	smn_control_acceso.smn_transacciones_manuales.trm_identificacion,
	smn_control_acceso.smn_transacciones_manuales.trm_tipo_marcaje,
	smn_control_acceso.smn_transacciones_manuales.trm_jutificacion,
	smn_control_acceso.smn_transacciones_manuales.trm_fecha_transaccion,
	smn_control_acceso.smn_transacciones_manuales.trm_hora_transaccion,
	smn_control_acceso.smn_transacciones_manuales.trm_fecha_registro,
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id
from
	smn_control_acceso.smn_transacciones_manuales
where
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id is not null
	${filter}
order by
	smn_control_acceso.smn_transacciones_manuales.smn_transacciones_manuales_id desc
