select
		smn_control_acceso.smn_asistencia_comedor.smn_asistencia_comedor_id,
	case
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='GE' then '${lbl:b_generada}'
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='PR' then '${lbl:b_procesada}'
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='EN' then '${lbl:b_entregada}'
	end as com_estatus,
	smn_control_acceso.smn_asistencia_comedor.smn_asistencia_id,
	smn_control_acceso.smn_asistencia_comedor.smn_movimiento_marcaje_id,
	smn_control_acceso.smn_asistencia_comedor.smn_personal_id,
	smn_control_acceso.smn_asistencia_comedor.com_fecha_generada,
	smn_control_acceso.smn_asistencia_comedor.com_hora_generada,
	smn_control_acceso.smn_asistencia_comedor.com_hora_marcaje,
	smn_control_acceso.smn_asistencia_comedor.com_hora_entregada,
	smn_control_acceso.smn_asistencia_comedor.com_estatus,
	smn_control_acceso.smn_asistencia_comedor.com_fecha_registro
	
from
	smn_control_acceso.smn_asistencia_comedor
