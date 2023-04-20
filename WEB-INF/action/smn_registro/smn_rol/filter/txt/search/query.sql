select
	smn_control_acceso.smn_rol.smn_rol_id,
	case
	when smn_control_acceso.smn_rol.rol_tipo='SO' then '${lbl:b_solicitante}'
	when smn_control_acceso.smn_rol.rol_tipo='AP' then '${lbl:b_autorizador}'
	when smn_control_acceso.smn_rol.rol_tipo='AM' then '${lbl:b_ambos}'
	when smn_control_acceso.smn_rol.rol_tipo='AD' then '${lbl:b_administrator}'
	end as rol_tipo,
	smn_base.smn_corporaciones.crp_codigo||'-'||smn_base.smn_corporaciones.crp_nombre as smn_corporacion_rf,
	smn_base.smn_entidades.ent_codigo||'-'||smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo||'-'||smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_base.smn_areas_servicios.ase_codigo||'-'||smn_base.smn_areas_servicios.ase_descripcion as smn_area_servicio_rf,
	smn_base.smn_unidades_servicios.uns_codigo||'-'||smn_base.smn_unidades_servicios.uns_descripcion as smn_unidad_servicio_rf,
	smn_base.smn_estructura_organizacional.eor_codigo||'-'||smn_base.smn_estructura_organizacional.eor_nombre as smn_estructura_organizacional_rf,
  smn_base.smn_v_usuarios.usr_nombres|| ' - ' || smn_base.smn_v_usuarios.usr_apellidos as smn_usuario_id,
	smn_control_acceso.smn_rol.rol_fecha_registro
	
from
	smn_control_acceso.smn_rol
	left outer join smn_base.smn_corporaciones on smn_base.smn_corporaciones.smn_corporaciones_id = smn_control_acceso.smn_rol.smn_corporacion_rf
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_rol.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_rol.smn_sucursal_rf
	left outer join smn_base.smn_areas_servicios on smn_base.smn_areas_servicios.smn_areas_servicios_id = smn_control_acceso.smn_rol.smn_area_servicio_rf
	left outer join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_control_acceso.smn_rol.smn_unidad_servicio_rf
	left outer join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_rol.smn_estructura_organizacional_rf
	left outer join smn_base.smn_v_usuarios on smn_base.smn_v_usuarios.smn_usuarios_id = smn_control_acceso.smn_rol.smn_usuario_id
	


