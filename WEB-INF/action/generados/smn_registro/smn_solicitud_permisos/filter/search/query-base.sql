select	
	smn_control_acceso.smn_personal.smn_personal_id, 
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	(select smn_gip.smn_documentos.dcm_codigo|| " - " || smn_gip.smn_documentos.dcm_nombre from  smn_gip.smn_documentos  where smn_gip.smn_documentos.smn_documentos_id is not null  and smn_gip.smn_documentos.smn_documentos_id=smn_control_acceso.smn_solicitud_permisos.spe_documento_rf  order by smn_gip.smn_documentos.dcm_nombre ) as spe_documento_rf_combo,
	(select smn_gip.smn_categoria_justificaciones.cju_codigo || " - " || smn_gip.smn_categoria_justificaciones.cju_nombre from  smn_gip.smn_categoria_justificaciones  where smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id is not null  and smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id=smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf  order by smn_gip.smn_categoria_justificaciones.cju_nombre ) as spe_categoria_justif_rf_combo,
	case
		when smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='APR' then '${lbl:b_approved}'
		when smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='NAP' then '${lbl:b_not_approved}'
		when smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='PEN' then '${lbl:b_pending}'
	end as spe_estatus_rf_combo,
	(select smn_control_acceso.smn_personal.psl_num_control || " - " || smn_control_acceso.smn_personal.psl_id_control_acceso from  smn_control_acceso.smn_personal  where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf  order by smn_control_acceso.smn_personal.psl_id_control_acceso ) as spe_jefe_inmediato_rf_combo,
	smn_control_acceso.smn_solicitud_permisos.smn_personal_id,
	smn_control_acceso.smn_solicitud_permisos.spe_documento_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_desde,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_hasta,
	smn_control_acceso.smn_solicitud_permisos.spe_cantidad_horas,
	smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_detalles,
	smn_control_acceso.smn_solicitud_permisos.spe_causa,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_registro,
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id
from
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_solicitud_permisos
where
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id is not null	
and 		
	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_solicitud_permisos.smn_personal_id 
	${filter}
order by
	smn_control_acceso.smn_solicitud_permisos.smn_personal_id desc