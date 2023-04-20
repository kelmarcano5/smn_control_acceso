select
		smn_control_acceso.smn_justificaciones.smn_justificaciones_id,
	smn_control_acceso.smn_personal.smn_personal_id,
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
select
		smn_control_acceso.smn_justificaciones.smn_justificaciones_id,
	smn_control_acceso.smn_justificaciones.smn_personal_id,
	smn_control_acceso.smn_justificaciones.jus_descripcion,
	smn_control_acceso.smn_justificaciones.jus_fecha_incidencia,
	smn_control_acceso.smn_justificaciones.jus_hora_incidencia,
	smn_control_acceso.smn_justificaciones.jus_tiempo_a_justificar,
	smn_control_acceso.smn_justificaciones.jus_aprobado_por,
	smn_control_acceso.smn_justificaciones.jus_fecha_registro
from
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_justificaciones
where
	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id
order by
			smn_control_acceso.smn_justificaciones.smn_justificaciones_id desc
