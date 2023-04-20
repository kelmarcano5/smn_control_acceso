select	
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_mov_marcajes_hist.mrk_auxiliar_rf  order by smn_base.smn_v_auxiliar.smn_item ) as mrk_auxiliar_rf_combo,
	case
		when smn_control_acceso.smn_mov_marcajes_hist.mrk_marcaje_tipo_rf='ENT' then '${lbl:b_entry}'
		when smn_control_acceso.smn_mov_marcajes_hist.mrk_marcaje_tipo_rf='SAL' then '${lbl:b_exit}'
		when smn_control_acceso.smn_mov_marcajes_hist.mrk_marcaje_tipo_rf='ESL' then '${lbl:b_entry_exit}'
	end as mrk_marcaje_tipo_rf_combo,
	smn_control_acceso.smn_mov_marcajes_hist.*
from
	smn_control_acceso.smn_mov_marcajes_hist
	
 	 
