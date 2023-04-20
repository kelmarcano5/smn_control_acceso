SELECT 	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id,
	smn_base.smn_estructura_organizacional.eor_nombre as item

	FROM smn_base.smn_estructura_organizacional
	inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_estructura_organizacional.eor_aprobador 
	inner join smn_base.smn_estructura_organizacional sup on sup.eor_aprobador = smn_base.smn_usuarios.smn_auxiliar_rf
	inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
 WHERE smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id IN (
		SELECT smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id from smn_base.smn_configuracion_estructura where smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id IN (
			SELECT smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id from smn_base.smn_rel_entidad_estructura WHERE smn_base.smn_rel_entidad_estructura.smn_entidades_id IN (
				SELECT smn_base.smn_entidades.smn_entidades_id FROM smn_base.smn_entidades 
				WHERE 
					smn_base.smn_entidades.smn_entidades_id=${fld:id}
				)
			)
		) and smn_seguridad.s_user.userlogin='${def:user}' 

order by smn_base.smn_estructura_organizacional.eor_nombre asc