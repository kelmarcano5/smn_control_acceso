select
		smn_control_acceso.smn_carnet_identificacion.cid_codigo
from
		smn_control_acceso.smn_carnet_identificacion
where
		upper(smn_control_acceso.smn_carnet_identificacion.cid_codigo) = upper(${fld:cid_codigo})
