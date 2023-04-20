select
		smn_control_acceso.smn_carnet_identificacion.cid_descripcion
from
		smn_control_acceso.smn_carnet_identificacion
where
		upper(smn_control_acceso.smn_carnet_identificacion.cid_descripcion) = upper(${fld:cid_descripcion})
