select smn_control_acceso.smn_personal.smn_personal_id as id, smn_base.smn_auxiliar.aux_apellidos ||' '|| smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_num_doc_oficial   as item 
from  smn_control_acceso.smn_personal
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
left outer join smn_base.smn_usuarios on smn_base.smn_usuarios.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
left outer join smn_seguridad.s_user on smn_seguridad.s_user.user_id = smn_base.smn_usuarios.smn_user_rf
order by smn_base.smn_auxiliar.aux_apellidos  asc