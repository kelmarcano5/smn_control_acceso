select smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id as id, smn_base.smn_estructura_organizacional.eor_codigo || ' - ' ||  smn_base.smn_estructura_organizacional.eor_nombre as item from smn_base.smn_estructura_organizacional order by smn_base.smn_estructura_organizacional.eor_nombre