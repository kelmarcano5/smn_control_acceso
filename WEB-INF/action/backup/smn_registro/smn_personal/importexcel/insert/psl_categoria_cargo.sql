select 
	smn_gip.smn_categoria_cargos.smn_categoria_cargos_id as psl_categoria_cargo_ref 
from   
	smn_gip.smn_categoria_cargos 
where  
	upper(smn_gip.smn_categoria_cargos.cat_nombre) = upper(${fld:psl_categoria_cargo_desc})
