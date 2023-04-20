select 
	smn_control_acceso.smn_personal.smn_personal_id as id, 
	smn_base.smn_auxiliar_persona_natural.ant_nombres || ' ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos as item 
from 
	smn_control_acceso.smn_personal
	inner join smn_base.smn_auxiliar_persona_natural on smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
order by 
	smn_base.smn_auxiliar_persona_natural.ant_nombres