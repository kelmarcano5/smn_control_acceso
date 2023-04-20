select DISTINCT smn_control_acceso.smn_asistencia.asi_personal_rf as id, smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item as item
from smn_base.smn_v_auxiliar 
inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_auxiliar_rf = smn_base.smn_v_auxiliar.smn_v_auxiliar_id 
inner join smn_control_acceso.smn_asistencia on smn_control_acceso.smn_asistencia.asi_personal_rf =  smn_control_acceso.smn_personal.smn_personal_id
inner join smn_control_acceso.smn_plan_asistencia on smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id = smn_control_acceso.smn_asistencia.smn_plan_asistencia_id
where smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id=${fld:id3}