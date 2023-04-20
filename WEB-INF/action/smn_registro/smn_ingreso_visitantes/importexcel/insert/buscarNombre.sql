select
		smn_control_acceso.smn_visitantes.vis_nombre
from
		smn_control_acceso.smn_visitantes
where
		upper(smn_control_acceso.smn_visitantes.vis_nombre) = upper(${fld:vis_nombre})
