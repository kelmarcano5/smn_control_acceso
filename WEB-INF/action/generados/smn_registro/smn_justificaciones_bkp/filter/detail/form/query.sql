select	
	smn_control_acceso.smn_personal.smn_personal_id, 
	smn_control_acceso.smn_personal.psl_num_control as psl_num_control_pl0,
	(select smn_control_acceso.smn_personal.psl_num_control || ' - ' || smn_control_acceso.smn_personal.psl_id_control_acceso from  smn_control_acceso.smn_personal  where smn_control_acceso.smn_personal.smn_personal_id is not null  and smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id  order by smn_control_acceso.smn_personal.psl_id_control_acceso ) as smn_personal_id_combo,
	smn_control_acceso.smn_justificaciones.*
from
	smn_control_acceso.smn_personal,
	smn_control_acceso.smn_justificaciones 
where
	smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_justificaciones.smn_personal_id 
 and 
	smn_control_acceso.smn_justificaciones.smn_justificaciones_id = ${fld:id}
