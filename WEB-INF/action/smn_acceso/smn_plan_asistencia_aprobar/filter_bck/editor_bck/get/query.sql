SELECT 	smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id,
	smn_base.smn_estructura_organizacional.eor_codigo||'-'||smn_base.smn_estructura_organizacional.eor_nombre as item

	FROM smn_base.smn_estructura_organizacional WHERE smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id IN (
		SELECT smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id from smn_base.smn_configuracion_estructura where smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id IN (
			SELECT smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id from smn_base.smn_rel_entidad_estructura WHERE smn_base.smn_rel_entidad_estructura.smn_entidades_id IN (
				SELECT smn_base.smn_entidades.smn_entidades_id FROM smn_base.smn_entidades 
				WHERE 
					upper(smn_base.smn_entidades.ent_descripcion_corta)=upper(${fld:id}) 
				)
			)
		)