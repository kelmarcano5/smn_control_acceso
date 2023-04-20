select
	case
	when smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar='SI' then '${lbl:b_yes}'
	when smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar='NO' then '${lbl:b_not}'
	end as rpv_autorizado_almorzar,
	case
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='RE' then '${lbl:b_registrado}'
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='GE' then '${lbl:b_generado}'
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='IN' then '${lbl:b_ingress}'
	end as rpv_estatus,
	smn_control_acceso.smn_personal_visitantes.*
from
	smn_control_acceso.smn_personal_visitantes
where
	smn_personal_visitantes_id = ${fld:id}
