select smn_control_acceso.smn_personal.smn_personal_id as id, smn_control_acceso.smn_personal.psl_num_control || " - "|| smn_control_acceso.smn_personal.psl_id_control_acceso as item from smn_control_acceso.smn_personal order by smn_control_acceso.smn_personal.psl_id_control_acceso