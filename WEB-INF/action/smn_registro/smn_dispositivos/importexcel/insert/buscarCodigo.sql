select
		smn_control_acceso.smn_dispositivos.dis_codigo
from
		smn_control_acceso.smn_dispositivos
where
		upper(smn_control_acceso.smn_dispositivos.dis_codigo) = upper(${fld:dis_codigo})
