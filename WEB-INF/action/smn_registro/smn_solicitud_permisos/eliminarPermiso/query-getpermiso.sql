select * from smn_control_acceso.smn_solicitud_permisos 
inner join smn_gip.smn_categoria_justificaciones on smn_gip.smn_categoria_justificaciones.smn_categoria_justificaciones_id=smn_control_acceso.smn_solicitud_permisos.spe_categoria_justif_rf
where smn_solicitud_permisos_id = ${fld:id}