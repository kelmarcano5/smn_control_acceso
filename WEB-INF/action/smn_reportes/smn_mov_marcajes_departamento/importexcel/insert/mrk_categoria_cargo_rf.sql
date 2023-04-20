select 
	smn_gip.smn_categoria_cargos.smn_categoria_cargos_id as mrk_categoria_cargo_rf_ref 
from   
	smn_gip.smn_categoria_cargos 
where  
	upper(smn_gip.smn_categoria_cargos.cac_nombre

b_access_control) = upper(${fld:mrk_categoria_cargo_rf_desc})
