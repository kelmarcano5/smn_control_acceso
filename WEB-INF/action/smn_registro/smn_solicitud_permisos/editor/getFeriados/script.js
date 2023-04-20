let myTable= "<table style='width:100%; border-collapse: separate; border-spacing: 5px;'>";
	myTable+="<tr style='width:100%; border-collapse: separate; border-spacing: 10px';><td> ${fld:seccion} </td></tr>";
<rows>
	myTable+="<tr style='background:${fld:csp_color_sombreado};'><td style=' color:${fld:csp_color_letra};font-family:${fld:csp_tipo_letra};font-size:${fld:csp_tamano_letra};text-indent:${fld:csp_espacio_identacion}; border: solid; border-width: 15px 15;'> ${fld:pregunta_combo}";
	myTable+="<table style='width:100%; border-collapse: separate; border-spacing: 10px;'>";
	if('${fld:smn_tipo_variable_col_1_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input type='text' class='respuestas entero' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input type='text' class='respuestas' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input type='text' class='respuestas decimal' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input type='date' class='respuestas' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input type='time' class='respuestas' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
	}

	if('${fld:smn_tipo_variable_col_2_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input type='text' class='respuestas entero' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input type='text' class='respuestas' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input type='text' class='respuestas decimal' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input type='date' class='respuestas' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input type='time' class='respuestas' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
	}

	if('${fld:smn_tipo_variable_col_3_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input type='text' class='respuestas entero' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input type='text' class='respuestas' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input type='text' class='respuestas decimal' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input type='date' class='respuestas' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input type='time' class='respuestas' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
	}

	if('${fld:smn_tipo_variable_col_4_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input type='text' class='respuestas entero' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input type='text' class='respuestas' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input type='text' class='respuestas decimal' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input type='date' class='respuestas' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input type='time' class='respuestas' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_pregunta_id}'></td></tr>";
	}
	myTable+="</table>";
	myTable+="</td></tr>"; 
</rows>
myTable+="</table>";
document.getElementById('preguntas${fld:id}').innerHTML = myTable;

$(".entero").keypress(function(tecla){
	if(tecla.keyCode < 48 ||  tecla.keyCode > 57)
		return false;
});

$(".decimal").keypress(function(tecla){

	if(tecla.keyCode < 48 ||  tecla.keyCode > 57)
	{
		if(tecla.keyCode != 46 || this.value == "")
		{
			return false;
		}
	}
});