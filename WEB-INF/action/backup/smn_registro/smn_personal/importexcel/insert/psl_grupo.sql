select 
	smn_control_acceso.smn_turnos,.smn_turnos,_id as psl_grupo_ref 
from   
	smn_control_acceso.smn_turnos, 
where  
	upper(smn_control_acceso.smn_turnos.tur_nombre) = upper(${fld:psl_grupo_desc})
