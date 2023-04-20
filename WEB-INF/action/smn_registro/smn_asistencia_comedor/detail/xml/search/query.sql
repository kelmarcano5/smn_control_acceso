select
select
select
select
	case
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='GE' then '${lbl:b_generada}'
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='PR' then '${lbl:b_procesada}'
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='EN' then '${lbl:b_entregada}'
	end as com_estatus,
	smn_control_acceso.smn_asistencia_comedor.*
from
	smn_control_acceso.smn_asistencia_comedor
where
	smn_asistencia_comedor_id = ${fld:id}
