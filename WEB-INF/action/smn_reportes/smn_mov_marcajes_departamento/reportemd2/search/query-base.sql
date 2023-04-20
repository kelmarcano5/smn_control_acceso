SELECT smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item as mrk_auxiliar_rf,
CASE WHEN 
		smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf = 'ENT' THEN 	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora 
END AS HORA_ENTRADA,
CASE WHEN 
		smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf = 'SAL' THEN 	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora 
END AS HORA_SALIDA,
SUM(to_number(smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora, smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora)) AS horas_efectivas,
smn_control_acceso.smn_mov_marcajes.mrk_marcaje_fecha
from 
	smn_control_acceso.smn_mov_marcajes
	left OUTER join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_control_acceso.smn_mov_marcajes.mrk_auxiliar_rf
where
	smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id is not null	
	${filter}
group by 	smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf, smn_base.smn_v_auxiliar.smn_codigo, 
smn_base.smn_v_auxiliar.smn_item,smn_control_acceso.smn_mov_marcajes.mrk_marcaje_tipo_rf, smn_control_acceso.smn_mov_marcajes.mrk_marcaje_hora,
smn_control_acceso.smn_mov_marcajes.mrk_marcaje_fecha