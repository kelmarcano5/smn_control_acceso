select smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id, smn_base.smn_estructura_organizacional.eor_nombre || ' - ' || smn_base.smn_estructura_organizacional.eor_codigo as item from smn_base.smn_estructura_organizacional 
left join smn_seguridad.s_user on smn_seguridad.s_user.userlogin = smn_base.smn_estructura_organizacional.eor_usuario
where smn_seguridad.s_user.userlogin='${def:user}'
order by smn_base.smn_estructura_organizacional.eor_nombre

	
