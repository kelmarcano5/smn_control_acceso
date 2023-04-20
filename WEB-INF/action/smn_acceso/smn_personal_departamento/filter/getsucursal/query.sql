SELECT 
smn_base.smn_sucursales.smn_sucursales_id as id,
smn_base.smn_sucursales.suc_codigo||'-'||smn_base.smn_sucursales.suc_nombre as item 
from smn_base.smn_sucursales 
inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_sucursal_rf = smn_base.smn_sucursales.smn_sucursales_id
inner join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_control_acceso.smn_personal.psl_auxiliar_rf
inner join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
where smn_base.smn_sucursales.suc_empresa=(SELECT smn_base.smn_entidades.smn_entidades_id
from smn_base.smn_entidades
where
upper(smn_base.smn_entidades.ent_descripcion_corta)=upper(${fld:id})) and smn_seguridad.s_user.userlogin='${def:user}'