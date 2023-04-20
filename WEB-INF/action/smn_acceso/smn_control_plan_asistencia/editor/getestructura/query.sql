SELECT 
smn_base.smn_rel_entidad_estructura.smn_rel_entidad_estructura_id as id,
smn_base.smn_configuracion_estructura.coe_codigo||'-'||smn_base.smn_configuracion_estructura.coe_nombre as item 
from 
smn_base.smn_rel_entidad_estructura
left OUTER join smn_base.smn_configuracion_estructura on 
smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id=smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id
left OUTER join smn_base.smn_entidades on 
smn_base.smn_entidades.smn_entidades_id=smn_base.smn_rel_entidad_estructura.smn_entidades_id
where
smn_base.smn_entidades.smn_entidades_id=(SELECT smn_base.smn_rel_entidad_estructura.smn_entidades_id 
FROM smn_base.smn_entidades
where
smn_base.smn_entidades.ent_descripcion_corta=${fld:id})