SELECT
	smn_control_acceso.smn_personal.smn_personal_id AS ID,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos AS item 
FROM
	smn_control_acceso.smn_personal
	LEFT OUTER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf 
	left join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	left join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_estructura_organizacional.eor_aprobador 
	left join smn_base.smn_estructura_organizacional sup on sup.eor_aprobador = smn_base.smn_usuarios.smn_auxiliar_rf
	left join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
and
	sup.eor_aprobador = smn_base.smn_usuarios.smn_auxiliar_rf
	and 
	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	and 
	smn_seguridad.s_user.userlogin='${def:user}'
ORDER BY
	smn_base.smn_auxiliar.aux_descripcion