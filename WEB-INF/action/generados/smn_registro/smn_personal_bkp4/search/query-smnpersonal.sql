select
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' || smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_control_acceso.smn_personal.psl_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as psl_auxiliar_combo,
	(select smn_base.smn_entidades.ent_codigo|| ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_control_acceso.smn_personal.psl_empresa  order by smn_base.smn_entidades.ent_descripcion_corta ) as psl_empresa_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_control_acceso.smn_personal.psl_sucursal  order by smn_base.smn_sucursales.suc_nombre ) as psl_sucursal_combo,
	(select smn_gip.smn_cargos.job_codigo|| ' - ' || smn_gip.smn_cargos.job_nombre from  smn_gip.smn_cargos  where smn_gip.smn_cargos.smn_cargos_id is not null  and smn_gip.smn_cargos.smn_cargos_id=smn_control_acceso.smn_personal.psl_cargo  order by smn_gip.smn_cargos.job_nombre ) as psl_cargo_combo,
	case
		when smn_control_acceso.smn_personal.psl_habilita_acceso='S' then '${lbl:b_yes}'
		when smn_control_acceso.smn_personal.psl_habilita_acceso='N' then '${lbl:b_not}'
	end as psl_habilita_acceso_combo,
	smn_control_acceso.smn_personal.psl_id_control_acceso,
	smn_control_acceso.smn_personal.psl_auxiliar,
	smn_control_acceso.smn_personal.psl_empresa,
	smn_control_acceso.smn_personal.psl_sucursal,
	smn_control_acceso.smn_personal.psl_cargo,
	smn_control_acceso.smn_personal.psl_habilita_acceso,
	smn_control_acceso.smn_personal.psl_fecha_registro

from 
	smn_control_acceso.smn_personal
