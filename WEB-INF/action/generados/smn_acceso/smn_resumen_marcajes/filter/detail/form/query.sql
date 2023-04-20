select
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_resumen_marcajes.igs_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as igs_auxiliar_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo || ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_control_acceso.smn_resumen_marcajes.igs_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as igs_clase_auxiliar_combo,
	(select smn_gip.smn_tipo_actividades.tya_codigo || ' - ' || smn_gip.smn_tipo_actividades.tya_nombre item from  smn_gip.smn_tipo_actividades  where smn_gip.smn_tipo_actividades.smn_tipo_actividades_id is not null  and smn_gip.smn_tipo_actividades.smn_tipo_actividades_id=smn_control_acceso.smn_resumen_marcajes.igs_actividad  order by smn_gip.smn_tipo_actividades.tya_nombre ) as igs_actividad_combo,
	smn_control_acceso.smn_resumen_marcajes.*
from 
	smn_control_acceso.smn_resumen_marcajes
where
	smn_control_acceso.smn_resumen_marcajes.smn_resumen_marcajes_id = ${fld:id}
