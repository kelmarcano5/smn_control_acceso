select 
	smn_gip.smn_cargos.smn_cargos_id as mrk_cargo_rf_ref 
from   
	smn_gip.smn_cargos 
where  
	upper(smn_gip.smn_cargos.job_nombre) = upper(${fld:mrk_cargo_rf_desc})
