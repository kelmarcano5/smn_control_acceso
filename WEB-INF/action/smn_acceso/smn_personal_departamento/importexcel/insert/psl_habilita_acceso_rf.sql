select
	COALESCE( 
		(select 
			case
				when upper(trim(${fld:psl_habilita_acceso_rf_desc})) = upper(trim('${lbl:b_yes}')) then 'S'
				when upper(trim(${fld:psl_habilita_acceso_rf_desc})) = upper(trim('${lbl:b_not}')) then 'N'
			end
	), '') as psl_habilita_acceso_rf_ref