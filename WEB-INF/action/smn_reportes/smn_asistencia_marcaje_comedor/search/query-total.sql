with ROWSS as (
select DISTINCT smn_control_acceso.smn_personal.smn_personal_id AS total
		
from
	smn_control_acceso.smn_mov_marcajes
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_mov_marcajes.smn_sucursal_rf
	inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id = smn_control_acceso.smn_mov_marcajes.smn_personal_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_control_acceso.smn_personal.psl_auxiliar_rf
	inner join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_entidades_id = smn_control_acceso.smn_mov_marcajes.smn_entidad_rf
	inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id =  smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id and smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
	inner join smn_gip.smn_dispositivos on smn_gip.smn_dispositivos.smn_dispositivos_id = cast(smn_control_acceso.smn_mov_marcajes.mrk_dispositivo_codigo as integer)
where
	smn_control_acceso.smn_mov_marcajes.smn_mov_marcajes_id is not null
	${filter}
)
select COUNT(ROWSS.total) as total FROM ROWSS
