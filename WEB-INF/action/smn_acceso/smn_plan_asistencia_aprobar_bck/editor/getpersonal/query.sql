select	
	smn_control_acceso.smn_personal.smn_personal_id as personal_id,
	smn_base.smn_auxiliar.aux_descripcion as item
from
	smn_control_acceso.smn_personal
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar_rf
where
	smn_control_acceso.smn_personal.smn_personal_id is not null
	and smn_control_acceso.smn_personal.psl_esquema_rotacion_rf=${fld:esquema}
	and smn_control_acceso.smn_personal.psl_estructura_organizacional_rf=${fld:estructura}
order by 
	smn_base.smn_auxiliar.aux_descripcion asc
	