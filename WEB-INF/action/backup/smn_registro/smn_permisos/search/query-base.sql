select	
	smn_control_acceso.smn_personal.smn_personal_id, 
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	(select smn_control_acceso.smn_personal.psl_num_control || ' - ' || smn_control_acceso.smn_personal.psl_id_control_acceso from  smn_control_acceso.smn_personal  where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_solicitud_permisos.smn_personal_id  order by smn_control_acceso.smn_personal.psl_id_control_acceso ) as smn_personal_id_combo,
	(select smn_gip.smn_categoria_justificaciones.cju_codigo || ' - ' || smn_gip.smn_categoria_justificaciones.cju_nombre from  smn_gip.smn_categoria_justificaciones  where smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id is not null  and smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id=smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif  order by smn_gip.smn_categoria_justificaciones.cju_nombre ) as spe_categoria_justif_combo,
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id,
	smn_control_acceso.smn_solicitud_permisos.spe_detalles,
	smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_desde,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_hasta,
	smn_control_acceso.smn_solicitud_permisos.spe_nro_horas,
	smn_control_acceso.smn_solicitud_permisos.spe_aprobado_por,
	smn_control_acceso.smn_solicitud_permisos.spe_archivo,
	smn_control_acceso.smn_solicitud_permisos.spe_contenido,
	smn_control_acceso.smn_solicitud_permisos.spe_tamano,
	smn_control_acceso.smn_solicitud_permisos.spe_idioma,
	smn_control_acceso.smn_solicitud_permisos.spe_usuario,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_registro,
	smn_control_acceso.smn_solicitud_permisos.spe_hora

from
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_solicitud_permisos 
where
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id is not null
and 	
	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_solicitud_permisos.smn_personal_id 
and
   	smn_control_acceso.smn_solicitud_permisos.spe_idioma = '${def:locale}'
and
	smn_control_acceso.smn_solicitud_permisos.spe_usuario = '${def:user}'
${filter}
order by 
	smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id