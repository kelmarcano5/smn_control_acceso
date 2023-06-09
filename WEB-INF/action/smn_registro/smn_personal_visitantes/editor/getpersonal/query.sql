SELECT 
smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
smn_base.smn_entidades.smn_entidades_id,
smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
smn_base.smn_sucursales.smn_sucursales_id,
smn_base.smn_auxiliar.aux_num_doc_oficial as smn_cedula_rf,
smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id
from smn_control_acceso.smn_personal
left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf
left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf
left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
where smn_control_acceso.smn_personal.smn_personal_id = ${fld:id}