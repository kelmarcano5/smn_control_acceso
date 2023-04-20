select	
	*
from 
	smn_control_acceso.smn_justificaciones
	--left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.eor_aprobador = smn_control_acceso.smn_justificaciones.jus_jefe_inmediato_rf
	--left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_estructura_organizacional.eor_aprobador
	--left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_estructura_organizacional.eor_auxiliar
	--left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
	--left outer  join smn_control_acceso.smn_rol on smn_control_acceso.smn_rol.smn_estructura_organizacional_rf = smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
	--inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_estructura_organizacional_rf= smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
where 
	smn_justificaciones_id = ${fld:id}


