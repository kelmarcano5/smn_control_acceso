select  smn_control_acceso.smn_personal.smn_personal_id as id, smn_base.smn_auxiliar.aux_apellidos  ||' - '|| smn_base.smn_auxiliar.aux_nombres as item

from  smn_control_acceso.smn_personal 
inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_control_acceso.smn_personal.psl_estructura_organizacional_rf 
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf 

where 
	smn_base.smn_estructura_organizacional.eor_aprobador=
	 (Select smn_control_acceso.smn_personal.psl_auxiliar_rf from smn_control_acceso.smn_personal
 		inner JOIN smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf=smn_control_acceso.smn_personal.psl_auxiliar_rf
 		inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
 		where smn_seguridad.s_user.userlogin='${def:user}')
order by item