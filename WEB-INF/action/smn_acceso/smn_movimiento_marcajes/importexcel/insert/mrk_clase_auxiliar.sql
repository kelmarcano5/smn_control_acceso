select 
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id as mrk_clase_auxiliar_ref 
from   
	smn_base.smn_clase_auxiliar 
where  
	upper(smn_base.smn_clase_auxiliar.cla_nombre) = upper(${fld:mrk_clase_auxiliar_desc})
