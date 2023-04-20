select
	smn_control_acceso.smn_resumen_marcajes.smn_resumen_marcajes_id,
	${field}
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
	smn_control_acceso.smn_resumen_marcajes.smn_resumen_marcajes_id is not null
	${filter}
	
	
