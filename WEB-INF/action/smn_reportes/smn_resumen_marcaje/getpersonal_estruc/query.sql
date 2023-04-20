select smn_control_acceso.smn_personal.smn_personal_id as id, smn_base.smn_auxiliar.aux_apellidos ||' '|| smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_num_doc_oficial   as item 
from smn_base.smn_auxiliar
inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
where smn_control_acceso.smn_personal.psl_estructura_organizacional_rf=${fld:id} order by smn_base.smn_auxiliar.aux_apellidos  asc
