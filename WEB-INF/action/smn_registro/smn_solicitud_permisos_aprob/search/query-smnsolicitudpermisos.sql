select
	smn_gip.smn_categoria_justificaciones.cju_nombre,
	smn_gip.smn_documentos.dcm_usuario as dcm_nombre,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
		smn_control_acceso.smn_solicitud_permisos.smn_solicitud_permisos_id,
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	case
		when smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='AP' then '${lbl:b_approved}'
		when smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='RZ' then '${lbl:b_not_approved}'
		when smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='GE' then 'Generada'
	end as spe_estatus_rf,
	per.aux_nombres||' '|| per.aux_apellidos as smn_personal_id,
	smn_control_acceso.smn_solicitud_permisos.spe_documento_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_desde,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_hasta,
	smn_control_acceso.smn_solicitud_permisos.spe_cantidad_horas,
	smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf,
	sup.aux_nombres||' '|| sup.aux_apellidos as spe_jefe_inmediato_rf,
	smn_control_acceso.smn_solicitud_permisos.spe_detalles,
	smn_control_acceso.smn_solicitud_permisos.spe_causa,
	smn_control_acceso.smn_solicitud_permisos.spe_fecha_registro
from
	smn_control_acceso.smn_solicitud_permisos
	inner join smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id = smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf
	left outer join smn_gip.smn_documentos on smn_gip.smn_documentos.smn_documentos_id = smn_control_acceso.smn_solicitud_permisos.spe_documento_rf
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_solicitud_permisos.smn_personal_id
	left outer join smn_base.smn_auxiliar per on per.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_auxiliar sup on sup.smn_auxiliar_id = smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf
	left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where 
	 smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf='PEN' --and smn_control_acceso.smn_solicitud_permisos.spe_usuario<>'${def:user}'
	 and smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf=(select smn_base.smn_usuarios.smn_auxiliar_rf from smn_base.smn_auxiliar
	left JOIN smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	where smn_seguridad.s_user.userlogin='${def:user}')
order by
	smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf  desc