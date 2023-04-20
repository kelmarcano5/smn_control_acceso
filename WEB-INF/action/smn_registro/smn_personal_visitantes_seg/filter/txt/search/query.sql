select
	smn_control_acceso.smn_personal_visitantes.smn_personal_visitantes_id,
	case
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='RE' then '${lbl:b_registrado}'
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='GE' then '${lbl:b_generado}'
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='IN' then '${lbl:b_ingress}'
	end as rpv_estatus,
	case
	when smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar='SI' then '${lbl:b_yes}'
	when smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar='NO' then '${lbl:b_not}'
	end as rpv_autorizado_almorzar,
	smn_control_acceso.smn_personal_visitantes.smn_entidad_rf,
	smn_control_acceso.smn_personal_visitantes.smn_sucursal_rf,
	smn_control_acceso.smn_personal_visitantes.smn_personal_id,
	smn_control_acceso.smn_personal_visitantes.smn_cedula_rf,
	smn_control_acceso.smn_personal_visitantes.smn_estructura_organizacional_rf,
	smn_control_acceso.smn_personal_visitantes.rpv_autorizador,
	smn_control_acceso.smn_personal_visitantes.rpv_estatus,
	smn_control_acceso.smn_personal_visitantes.rpv_fecha_registro,
	smn_control_acceso.smn_personal_visitantes.rpv_fecha_evento,
	smn_control_acceso.smn_personal_visitantes.rpv_razon_visita,
	smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar
	
from
	smn_control_acceso.smn_personal_visitantes
