DELETE FROM smn_control_acceso.smn_plan_asistencia_personal WHERE smn_plan_asistencia_id=${fld:id};
DELETE FROM smn_control_acceso.smn_plan_asistencia WHERE smn_plan_asistencia_id=${fld:id};
DELETE FROM smn_control_acceso.smn_asistencia WHERE smn_plan_asistencia_id=${fld:id};
