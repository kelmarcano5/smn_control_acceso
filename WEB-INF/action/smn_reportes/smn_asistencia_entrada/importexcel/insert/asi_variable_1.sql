select 
	smn_gip.smn_codigo_variable.smn_codigo_variable_id as asi_variable_1_ref 
from   
	smn_gip.smn_codigo_variable 
where  
	upper(cva_descripcion) = upper(${fld:asi_variable_1_desc})
