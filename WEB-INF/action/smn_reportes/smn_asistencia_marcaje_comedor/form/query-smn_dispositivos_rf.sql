select smn_gip.smn_dispositivos.smn_dispositivos_id as id, smn_gip.smn_dispositivos.dis_codigo||' - '|| smn_gip.smn_dispositivos.dis_descripcion as item from smn_gip.smn_dispositivos
where smn_gip.smn_dispositivos.dis_descripcion is not null and 
smn_gip.smn_dispositivos.dis_tipo_dispositivo_rf = 'EN'