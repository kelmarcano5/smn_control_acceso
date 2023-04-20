select 
	smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id as id, 
	smn_gip.smn_categoria_justificaciones.cju_codigo || ' - ' || smn_gip.smn_categoria_justificaciones.cju_nombre as item 
from 
	smn_gip.smn_categoria_justificaciones 
where smn_gip.smn_categoria_justificaciones.cju_tipo_permiso=${fld:id}
order by 
	smn_gip.smn_categoria_justificaciones.cju_nombre