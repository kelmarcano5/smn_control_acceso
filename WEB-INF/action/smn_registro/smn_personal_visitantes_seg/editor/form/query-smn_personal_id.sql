SELECT
	smn_control_acceso.smn_personal.smn_personal_id AS ID,
	smn_base.smn_auxiliar.aux_nombres ||' - '|| smn_base.smn_auxiliar.aux_apellidos ||'- C.I-'|| smn_base.smn_auxiliar.aux_num_doc_oficial AS item 
FROM
	smn_control_acceso.smn_personal
	LEFT OUTER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf 
ORDER BY
	smn_base.smn_auxiliar.aux_descripcion