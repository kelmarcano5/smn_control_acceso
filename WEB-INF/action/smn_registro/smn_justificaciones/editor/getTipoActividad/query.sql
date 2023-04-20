select distinct smn_gip.smn_tipo_actividades.smn_tipo_actividades_id as id, 
smn_gip.smn_tipo_actividades.tya_codigo || ' - ' || smn_gip.smn_tipo_actividades.tya_nombre as item 
from smn_gip.smn_tipo_actividades
inner join smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_tipo_actividad_id = smn_gip.smn_tipo_actividades.smn_tipo_actividades_id
where smn_gip.smn_tipo_actividades.smn_tipo_actividades_id is not null
and smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id=${fld:id} 