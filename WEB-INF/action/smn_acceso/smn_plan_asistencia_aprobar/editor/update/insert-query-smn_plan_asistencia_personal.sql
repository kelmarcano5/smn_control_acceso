INSERT INTO smn_control_acceso.smn_plan_asistencia_personal
(
	smn_plan_asistencia_personal_id,
	smn_plan_asistencia_id,
	smn_personal_id
)
VALUES 
(
	${seq:nextval@smn_control_acceso.seq_smn_plan_asistencia_personal},
	${fld:id},
	${fld:personal_id}
)