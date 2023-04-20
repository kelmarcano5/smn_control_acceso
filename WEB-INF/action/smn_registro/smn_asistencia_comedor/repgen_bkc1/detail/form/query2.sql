select
	smn_control_acceso.smn_asistencia_comedor.smn_asistencia_comedor_id,
	case
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='GE' then '${lbl:b_generada}'
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='PR' then '${lbl:b_procesada}'
	when smn_control_acceso.smn_asistencia_comedor.com_estatus='EN' then '${lbl:b_entregada}'
	end as com_estatus,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| aux_descripcion as smn_personal_id,
	smn_control_acceso.smn_asistencia_comedor.com_fecha_generada,
	smn_control_acceso.smn_asistencia_comedor.com_hora_generada,
	smn_control_acceso.smn_asistencia_comedor.com_hora_marcaje,
	smn_control_acceso.smn_asistencia_comedor.com_hora_entregada,
	smn_base.smn_estructura_organizacional.eor_nombre as psl_estructura_organizacional_rf,
	smn_base.smn_auxiliar.aux_num_doc_oficial,
	smn_control_acceso.smn_asistencia_comedor.com_fecha_registro
from
	smn_control_acceso.smn_asistencia_comedor
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_asistencia_comedor.smn_personal_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
where
	smn_control_acceso.smn_asistencia_comedor.smn_asistencia_comedor_id = ${fld:id}
