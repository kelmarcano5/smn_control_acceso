select smn_base.smn_centro_costo.smn_centro_costo_id as id, smn_base.smn_centro_costo.cco_codigo || ' - ' || smn_base.smn_centro_costo.cco_descripcion_corta as item from smn_base.smn_centro_costo order by  smn_base.smn_centro_costo.cco_descripcion_corta