select 
	COALESCE( 
		(select 
			case
				when upper(trim(${fld:trm_tipo_marcaje_desc})) = upper(trim('${lbl:b_in}')) then 'EN'
				when upper(trim(${fld:trm_tipo_marcaje_desc})) = upper(trim('${lbl:b_out}')) then 'SA'
				when upper(trim(${fld:trm_tipo_marcaje_desc})) = upper(trim('${lbl:b_entry_exit}')) then 'ES'
			end
	), '') as trm_tipo_marcaje_ref