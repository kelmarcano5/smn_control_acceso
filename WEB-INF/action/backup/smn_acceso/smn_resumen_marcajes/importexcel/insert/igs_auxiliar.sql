select 
	smn_base.smn_v_auxiliar.smn_v_auxiliar_id as igs_auxiliar_ref 
from   
	smn_base.smn_v_auxiliar 
where  
	upper(smn_base.smn_v_auxiliar.smn_item) = upper(${fld:igs_auxiliar_desc})
