select
	smn_control_acceso.smn_resumen_marcajes.igs_auxiliar,
	smn_base.smn_v_auxiliar.smn_item,
	(select
		smn_base.smn_v_auxiliar.smn_item
	 from 
	 	smn_base.smn_v_auxiliar
	 where 
	 	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = ${fld:igs_auxiliar_filter}) as auxiliar_filter,
	smn_control_acceso.smn_resumen_marcajes.igs_clase_auxiliar,
	smn_base.smn_clase_auxiliar.cla_nombre,
	(select
		smn_base.smn_clase_auxiliar.cla_nombre
	 from 
	 	smn_base.smn_clase_auxiliar
	 where 
	 	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = ${fld:igs_clase_auxiliar_filter}) as clase_auxiliar_filter,
	smn_control_acceso.smn_resumen_marcajes.igs_control_acceso_id,
	smn_control_acceso.smn_resumen_marcajes.igs_actividad,
	smn_gip.smn_tipo_actividades.tya_nombre,
	(select
		smn_gip.smn_tipo_actividades.tya_nombre
	 from 
	 	smn_gip.smn_tipo_actividades
	 where 
	 	smn_gip.smn_tipo_actividades.smn_tipo_actividades_id = ${fld:igs_actividad_filter}) as actividad_filter,
	smn_control_acceso.smn_resumen_marcajes.igs_tiempo_efectivo,
	smn_control_acceso.smn_resumen_marcajes.igs_fecha,
	smn_control_acceso.smn_resumen_marcajes.igs_fecha_registro
from
	smn_gip.smn_tipo_actividades,
	smn_base.smn_v_auxiliar,
	smn_base.smn_clase_auxiliar,
	smn_control_acceso.smn_resumen_marcajes
where
	smn_gip.smn_tipo_actividades.smn_tipo_actividades_id = smn_control_acceso.smn_resumen_marcajes.igs_actividad 
and
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_resumen_marcajes.igs_auxiliar 
and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_control_acceso.smn_resumen_marcajes.igs_clase_auxiliar
and
	smn_control_acceso.smn_resumen_marcajes.smn_resumen_marcajes_id = ${fld:id}
