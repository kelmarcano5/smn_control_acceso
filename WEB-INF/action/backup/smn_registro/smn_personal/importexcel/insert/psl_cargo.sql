select 
	smn_gip.smn_cargos.smn_cargos_id as psl_cargo_ref 
from   
	smn_gip.smn_cargos 
where  
	upper(smn_gip.smn_cargos.job_nombre) = upper(${fld:psl_cargo_desc})
