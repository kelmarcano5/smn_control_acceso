SELECT 	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id,
	smn_base.smn_estructura_organizacional.eor_nombre || ' - ' || smn_base.smn_estructura_organizacional.eor_codigo  as item

	FROM smn_base.smn_estructura_organizacional 
	left outer join smn_base.smn_configuracion_estructura on smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id = smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
	left outer join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id = smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id =  smn_base.smn_rel_entidad_estructura.smn_entidades_id
where smn_base.smn_rel_entidad_estructura.smn_entidades_id = ${fld:id}
AND
smn_base.smn_estructura_organizacional.eor_aprobador=
	 (Select smn_control_acceso.smn_personal.psl_auxiliar_rf from smn_control_acceso.smn_personal
 		inner JOIN smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf=smn_control_acceso.smn_personal.psl_auxiliar_rf
 		inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
		where smn_seguridad.s_user.userlogin='${def:user}')
 order by smn_base.smn_estructura_organizacional.eor_nombre asc