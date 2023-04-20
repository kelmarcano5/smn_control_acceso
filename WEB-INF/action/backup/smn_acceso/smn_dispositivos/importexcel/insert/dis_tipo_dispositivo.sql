select 
	COALESCE( 
		(select 
			case
				when upper(trim(${fld:dis_tipo_dispositivo_desc})) = upper(trim('${lbl:b_entry}')) then 'EN'
				when upper(trim(${fld:dis_tipo_dispositivo_desc})) = upper(trim('${lbl:b_exit}')) then 'SA'
				when upper(trim(${fld:dis_tipo_dispositivo_desc})) = upper(trim('${lbl:b_entry_exit}')) then 'ES'
			end
	), '') as dis_tipo_dispositivo_ref