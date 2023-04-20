select smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id as id, smn_gip.smn_esquema_rotacion.ero_codigo||'-'||smn_gip.smn_esquema_rotacion.ero_nombre as item from smn_gip.smn_esquema_rotacion
inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_esquema_rotacion_rf = smn_gip.smn_esquema_rotacion.smn_esquema_rotacion_id
where
smn_control_acceso.smn_personal.smn_personal_id=${fld:id}