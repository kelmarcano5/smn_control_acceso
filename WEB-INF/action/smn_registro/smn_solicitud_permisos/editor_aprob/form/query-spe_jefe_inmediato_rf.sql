select smn_base.smn_estructura_organizacional.eor_aprobador as id, 
smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as item 
from smn_base.smn_estructura_organizacional
left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_base.smn_estructura_organizacional.eor_aprobador
where smn_base.smn_estructura_organizacional.eor_aprobador is not null