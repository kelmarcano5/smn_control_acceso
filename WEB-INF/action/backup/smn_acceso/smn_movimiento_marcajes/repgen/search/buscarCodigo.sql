select
		smn_control_acceso.smn_movimiento_marcajes.mrk_dispositivo_codigo
from
		smn_control_acceso.smn_movimiento_marcajes
where
		upper(smn_control_acceso.smn_movimiento_marcajes.mrk_dispositivo_codigo) = upper(${fld:mrk_dispositivo_codigo})
