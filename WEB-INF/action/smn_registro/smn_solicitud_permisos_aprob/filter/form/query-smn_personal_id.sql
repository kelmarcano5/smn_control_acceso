select DISTINCT smn_control_acceso.smn_personal.smn_personal_id as id, smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos as item
from  smn_control_acceso.smn_personal
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
inner join smn_control_acceso.smn_solicitud_permisos on smn_control_acceso.smn_solicitud_permisos.smn_personal_id = 
smn_control_acceso.smn_personal.smn_personal_id
inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
where 
--smn_seguridad.s_user.userlogin<>'${def:user}' 
--and 
smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf=(select smn_base.smn_usuarios.smn_auxiliar_rf from smn_base.smn_auxiliar
	left JOIN smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	where smn_seguridad.s_user.userlogin='${def:user}')	 --order by smn_base.smn_auxiliar.aux_nombres asc