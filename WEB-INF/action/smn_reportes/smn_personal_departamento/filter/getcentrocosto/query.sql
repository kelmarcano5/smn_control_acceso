SELECT 	smn_base.smn_centro_costo.smn_centro_costo_id as id,
	smn_base.smn_centro_costo.cco_codigo||'-'||smn_base.smn_centro_costo.cco_descripcion_corta as item

	FROM smn_base.smn_centro_costo
	where
	smn_base.smn_centro_costo.cco_empresa=${fld:id}