select	
	smn_control_acceso.smn_personal.smn_personal_id, 
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	(select smn_control_acceso.smn_personal.psl_num_control || ' - ' || smn_control_acceso.smn_personal.psl_id_control_acceso from  smn_control_acceso.smn_personal  where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id  order by smn_control_acceso.smn_personal.psl_id_control_acceso ) as smn_personal_id_combo,
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id,
	smn_control_acceso.smn_justificaciones.jus_descripcion,
	smn_control_acceso.smn_justificaciones.jus_fecha_incidencia,
	smn_control_acceso.smn_justificaciones.jus_hora_incidencia,
	smn_control_acceso.smn_justificaciones.jus_tiempo_a_justificar,
	smn_control_acceso.smn_justificaciones.jus_aprobado_por,
	smn_control_acceso.smn_justificaciones.jus_archivo,
	smn_control_acceso.smn_justificaciones.jus_contenido,
	smn_control_acceso.smn_justificaciones.jus_tamano,
	smn_control_acceso.smn_justificaciones.jus_idioma,
	smn_control_acceso.smn_justificaciones.jus_usuario,
	smn_control_acceso.smn_justificaciones.jus_fecha_registro,
	smn_control_acceso.smn_justificaciones.jus_hora

from
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_justificaciones 
where
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id is not null
and 	
	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id 
and
   	smn_control_acceso.smn_justificaciones.jus_idioma = '${def:locale}'
and
	smn_control_acceso.smn_justificaciones.jus_usuario = '${def:user}'
	${filter}
order by 
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id desc