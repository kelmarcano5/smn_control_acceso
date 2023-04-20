SELECT 
smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id,
smn_base.smn_estructura_organizacional.eor_codigo||'-'||smn_base.smn_estructura_organizacional.eor_nombre as item 
from smn_base.smn_estructura_organizacional
inner join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id = smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_estructura_organizacional.eor_aprobador
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
--where smn_base.smn_rel_entidad_estructura.smn_entidades_id=${fld:id}
--and smn_seguridad.s_user.userlogin='${def:user}'