select
		smn_control_acceso.smn_transacciones.smn_transacciones_id,
	case
	when smn_control_acceso.smn_transacciones.trn_tipo_marcaje='ENT' then '${lbl:b_in}'
	when smn_control_acceso.smn_transacciones.trn_tipo_marcaje='SAL' then '${lbl:b_out}'
	end as trn_tipo_marcaje_combo,
	smn_control_acceso.smn_transacciones.trn_sede,
	smn_control_acceso.smn_transacciones.trn_dispositivo,
	smn_control_acceso.smn_transacciones.trn_identificacion,
	smn_control_acceso.smn_transacciones.trn_tipo_marcaje,
	smn_control_acceso.smn_transacciones.trn_fecha_transaccion,
	smn_control_acceso.smn_transacciones.trn_hora_transaccion,
	smn_control_acceso.smn_transacciones.trn_fecha_registro
from
	smn_control_acceso.smn_transacciones
order by
		smn_control_acceso.smn_transacciones.smn_transacciones_id desc
