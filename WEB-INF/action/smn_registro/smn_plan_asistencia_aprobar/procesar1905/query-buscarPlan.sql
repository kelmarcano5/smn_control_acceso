select * from smn_control_acceso.smn_plan_asistencia 
left outer join smn_base.smn_estructura_organizacional on smn_estructura_organizacional.smn_estructura_organizacional_id = smn_plan_asistencia.smn_estructura_organizacional_rf
where cpa_status='RE' and smn_plan_asistencia_id = ${fld:idPlanAsistencia}
