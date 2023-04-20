select
		smn_control_acceso.smn_justificaciones.jus_descripcion
from
		smn_control_acceso.smn_justificaciones
where
		upper(smn_control_acceso.smn_justificaciones.jus_descripcion) = upper(${fld:jus_descripcion})
