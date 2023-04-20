select
		smn_control_acceso.smn_transacciones.smn_transacciones_id,
		smn_base.smn_auxiliar.smn_auxiliar_id,
		smn_base.smn_auxiliar.aux_num_doc_oficial||' - '|| smn_base.smn_auxiliar.aux_nombres||' '||smn_base.smn_auxiliar.aux_apellidos as personal,
	case
	when smn_control_acceso.smn_transacciones.trn_tipo_marcaje='ENT' then '${lbl:b_in}'
	when smn_control_acceso.smn_transacciones.trn_tipo_marcaje='SAL' then '${lbl:b_out}'
	end as trn_tipo_marcaje_combo,
	smn_gip.smn_dispositivos.dis_descripcion as trn_dispositivo,
	smn_control_acceso.smn_transacciones.trn_identificacion,
	smn_control_acceso.smn_transacciones.trn_tipo_marcaje,
	smn_control_acceso.smn_transacciones.trn_fecha_transaccion,
	smn_control_acceso.smn_transacciones.trn_hora_transaccion,
	smn_control_acceso.smn_transacciones.trn_fecha_registro
from
	smn_control_acceso.smn_transacciones
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_id_control_acceso = smn_control_acceso.smn_transacciones.trn_identificacion
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar.smn_clase_auxiliar_rf
	inner join smn_gip.smn_dispositivos on smn_gip.smn_dispositivos.dis_codigo = smn_control_acceso.smn_transacciones.trn_dispositivo
order by
		smn_control_acceso.smn_transacciones.smn_transacciones_id desc