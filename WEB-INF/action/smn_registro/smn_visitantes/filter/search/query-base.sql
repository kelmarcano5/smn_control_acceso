select
	smn_control_acceso.smn_visitantes.smn_visitantes_id,
  smn_base.smn_entidades.ent_descripcion_corta	as smn_entidad_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_codigo||' - '||smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizativa_rf,
	smn_base.smn_tipo_doc_oficial.tdo_descripcion ||' - '||  smn_base.smn_auxiliar.aux_num_doc_oficial as smn_tipo_documento_identidad_rf,
	smn_control_acceso.smn_visitantes.vis_documento_identidad,
	smn_control_acceso.smn_visitantes.vis_nombre,
	smn_control_acceso.smn_visitantes.vis_apellido,
	smn_control_acceso.smn_visitantes.vis_empresa,
	smn_control_acceso.smn_visitantes.smn_numero_carnet_asignado_id,
	smn_control_acceso.smn_visitantes.vis_hora_entrada,
	smn_control_acceso.smn_visitantes.vis_hora_estimada_salida,
	smn_control_acceso.smn_visitantes.vis_invitado_almuerzo,
	CASE
		WHEN smn_control_acceso.smn_visitantes.vis_estatus='RE' THEN '${lbl:b_register}'
		WHEN smn_control_acceso.smn_visitantes.vis_estatus='IN' THEN '${lbl:b_ingress}'
		WHEN smn_control_acceso.smn_visitantes.vis_estatus='AP' THEN '${lbl:b_aprobated_eating}'
		WHEN smn_control_acceso.smn_visitantes.vis_estatus='NA' THEN '${lbl:b_not_aprobated_eating}'
		WHEN smn_control_acceso.smn_visitantes.vis_estatus='NE' THEN '${lbl:b_anulated}'
	END AS vis_estatus,
smn_base.smn_auxiliar.aux_codigo||'-'||smn_base.smn_auxiliar.aux_descripcion	as smn_personal_id,
	smn_control_acceso.smn_visitantes.vis_fecha_vigencia,
	smn_control_acceso.smn_visitantes.vis_fecha_registro
from
	smn_control_acceso.smn_visitantes
	inner join smn_base.smn_entidades ON (smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_visitantes.smn_entidad_rf)
    inner join smn_base.smn_sucursales ON (smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_visitantes.smn_sucursal_rf)
    inner join smn_base.smn_estructura_organizacional ON (smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_visitantes.smn_estructura_organizativa_rf)
    inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id= smn_control_acceso.smn_visitantes.smn_personal_id
    left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	left join smn_base.smn_tipo_doc_oficial on smn_base.smn_tipo_doc_oficial.smn_tipo_doc_oficial_id = smn_base.smn_auxiliar.aux_tipo_doc_oficial_rf
where
	smn_control_acceso.smn_visitantes.smn_visitantes_id is not null AND 
	smn_control_acceso.smn_visitantes.vis_usuario='${def:user}' --and smn_control_acceso.smn_visitantes.asi_secuencia_tipo_marcaje=1
	${filter}
order by
		smn_visitantes_id
