select 
	smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id as id, 
	smn_gip.smn_categoria_justificaciones.cju_codigo || ' - ' || smn_gip.smn_categoria_justificaciones.cju_nombre as item 
from 
	smn_gip.smn_categoria_justificaciones 
order by 
	smn_gip.smn_categoria_justificaciones.cju_nombre