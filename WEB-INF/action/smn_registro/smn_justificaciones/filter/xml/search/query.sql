select
	smn_gip.smn_documentos.smn_documentos_generales_rf as dcm_nombre,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_gip.smn_tipo_actividades.tya_nombre,
	smn_control_acceso.smn_personal.smn_personal_id,
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	case
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='APR' then '${lbl:b_approved}'
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='NAP' then '${lbl:b_not_approved}'
	when smn_control_acceso.smn_justificaciones.jus_estatus_rf='PEN' then '${lbl:b_pending}'
	end as jus_estatus_rf,
	smn_control_acceso.smn_justificaciones.*
from
	smn_gip.smn_documentos,
	smn_control_acceso.smn_personal,
	smn_gip.smn_tipo_actividades,
	smn_control_acceso.smn_justificaciones
where
	smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_justificaciones.jus_documento_rf and
	smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_justificaciones.jus_jefe_inmediato_rf and
	smn_gip.smn_tipo_actividades.smn_tipo_actividades_id = smn_control_acceso.smn_justificaciones.jus_tipo_actividad_rf and
	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id
