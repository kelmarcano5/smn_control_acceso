select DISTINCT smn_base.smn_estructura_organizacional.eor_aprobador as id, 
smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_estructura_organizacional
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_estructura_organizacional.eor_aprobador
left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_estructura_organizacional.eor_auxiliar
left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
left outer  join smn_control_acceso.smn_rol on smn_control_acceso.smn_rol.smn_estructura_organizacional_rf = smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
--inner join smn_control_acceso.smn_solicitud_permisos on smn_control_acceso.smn_solicitud_permisos.spe_jefe_inmediato_rf = smn_base.smn_estructura_organizacional.eor_aprobador
inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_estructura_organizacional_rf= smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
where smn_base.smn_estructura_organizacional.eor_aprobador is not null
and smn_control_acceso.smn_personal.smn_personal_id=${fld:id}