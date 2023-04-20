select
	smn_control_acceso.smn_personal_visitantes.smn_personal_visitantes_id,
	case
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='RE' then '${lbl:b_registrado}'
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='GE' then '${lbl:b_generado}'
	when smn_control_acceso.smn_personal_visitantes.rpv_estatus='IN' then '${lbl:b_ingress}'
	end as rpv_estatus,
	case
	when smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar='SI' then '${lbl:b_yes}'
	when smn_control_acceso.smn_personal_visitantes.rpv_autorizado_almorzar='NO' then '${lbl:b_not}'
	end as rpv_autorizado_almorzar,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_auxiliar.aux_descripcion as smn_personal_id,
	smn_base.smn_auxiliar.aux_num_doc_oficial as smn_cedula_rf,
	smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
	aut.aux_descripcion as rpv_autorizador,
	smn_control_acceso.smn_personal_visitantes.rpv_fecha_registro,
	smn_control_acceso.smn_personal_visitantes.rpv_fecha_evento,
	smn_control_acceso.smn_personal_visitantes.rpv_razon_visita
from
	smn_control_acceso.smn_personal_visitantes
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal_visitantes.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal_visitantes.smn_sucursal_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal_visitantes.smn_estructura_organizacional_rf
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id= smn_control_acceso.smn_personal_visitantes.smn_personal_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_base.smn_auxiliar aut on aut.smn_auxiliar_id = smn_control_acceso.smn_personal_visitantes.rpv_autorizador
where
	smn_control_acceso.smn_personal_visitantes.smn_personal_visitantes_id is not null
	${filter}
order by
		smn_control_acceso.smn_personal_visitantes.smn_personal_visitantes_id desc
