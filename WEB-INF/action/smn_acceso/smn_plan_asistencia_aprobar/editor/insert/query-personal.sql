select	* 
	from
	smn_control_acceso.smn_personal
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar_rf
