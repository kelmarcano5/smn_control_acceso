select
	smn_gip.smn_control_esquema_rotacion.smn_control_esquema_rotacion_id,
	smn_base.smn_auxiliar.aux_nombres||' '||smn_base.smn_auxiliar.aux_apellidos as smn_personal_id,
	ac.ero_codigo||' - '|| ac.ero_nombre as smn_esquema_rotacion_actual_rf,
	nv.ero_codigo||' - '|| nv.ero_nombre as smn_esquema_rotacion_nuevo_rf,
	smn_gip.smn_control_esquema_rotacion.cer_fecha_vigencia,
	smn_gip.smn_control_esquema_rotacion.smn_personal_id as personal,
	smn_gip.smn_control_esquema_rotacion.smn_esquema_rotacion_nuevo_rf as esquema_rotacion_nuevo,
	smn_gip.smn_control_esquema_rotacion.cer_fecha_registro
	
from
	smn_gip.smn_control_esquema_rotacion
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_gip.smn_control_esquema_rotacion.smn_personal_id
	inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_control_acceso.smn_personal.psl_estructura_organizacional_rf 
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_gip.smn_esquema_rotacion nv on nv.smn_esquema_rotacion_id = 	smn_gip.smn_control_esquema_rotacion.smn_esquema_rotacion_nuevo_rf
	inner join smn_gip.smn_esquema_rotacion ac on ac.smn_esquema_rotacion_id = 	smn_gip.smn_control_esquema_rotacion.smn_esquema_rotacion_actual_rf
	
where 
	smn_base.smn_estructura_organizacional.eor_aprobador=
	 (Select smn_control_acceso.smn_personal.psl_auxiliar_rf from smn_control_acceso.smn_personal
 		inner JOIN smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf=smn_control_acceso.smn_personal.psl_auxiliar_rf
 		inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
 		where smn_seguridad.s_user.userlogin='${def:user}')
