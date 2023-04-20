select
		smn_control_acceso.smn_justificaciones.jus_descripcion
from
		smn_control_acceso.smn_justificaciones
where
		smn_control_acceso.smn_justificaciones.jus_descripcion = ${fld:jus_descripcion}
