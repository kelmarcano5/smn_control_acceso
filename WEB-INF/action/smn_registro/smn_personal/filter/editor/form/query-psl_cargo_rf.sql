select smn_gip.smn_cargos.smn_cargos_id as id, smn_gip.smn_cargos.job_codigo|| ' - ' || smn_gip.smn_cargos.job_nombre as item from smn_gip.smn_cargos order by job_nombre