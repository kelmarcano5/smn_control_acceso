select smn_base.smn_auxiliar.smn_auxiliar_id as id,smn_base.smn_auxiliar.aux_apellidos||' '||smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_num_doc_oficial as item from smn_base.smn_auxiliar
where smn_base.smn_auxiliar.aux_tipo_persona='PN'