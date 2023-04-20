select
	smn_control_acceso.smn_visitantes.smn_visitantes_id,
  smn_base.smn_entidades.ent_descripcion_corta	as smn_entidad_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_estructura_organizacional.eor_codigo||'-'||smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizativa_rf,
	smn_control_acceso.smn_visitantes.smn_tipo_documento_identidad_rf,
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
	smn_control_acceso.smn_visitantes.vis_fecha_registro,
	cod1.cva_codigo ||' - '|| cod1.cva_descripcion as smn_codigo_variable_1,
	smn_control_acceso.smn_visitantes.smn_valor_variable_1,
	cod2.cva_codigo ||' - '|| cod2.cva_descripcion as smn_codigo_variable_2,
	smn_control_acceso.smn_visitantes.smn_valor_variable_2
	
from
	smn_control_acceso.smn_visitantes
INNER JOIN smn_base.smn_entidades ON (smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_visitantes.smn_entidad_rf)
        INNER JOIN smn_base.smn_sucursales ON (smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_visitantes.smn_sucursal_rf)
        INNER JOIN smn_base.smn_estructura_organizacional ON (smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_visitantes.smn_estructura_organizativa_rf)
        inner JOIN smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id= smn_control_acceso.smn_visitantes.smn_personal_id
        left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
        left join smn_gip.smn_codigo_variable cod1 on cod1.smn_codigo_variable_id = smn_control_acceso.smn_visitantes.smn_codigo_variable_1
        left join smn_gip.smn_codigo_variable cod2 on cod2.smn_codigo_variable_id = smn_control_acceso.smn_visitantes.smn_codigo_variable_1
where
	smn_visitantes_id = ${fld:id}
