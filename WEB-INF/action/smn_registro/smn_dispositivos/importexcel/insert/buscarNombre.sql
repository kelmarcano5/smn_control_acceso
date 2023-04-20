select
		smn_control_acceso.smn_dispositivos.dis_nombre
from
		smn_control_acceso.smn_dispositivos
where
		upper(smn_control_acceso.smn_dispositivos.dis_nombre) = upper(${fld:dis_nombre})
