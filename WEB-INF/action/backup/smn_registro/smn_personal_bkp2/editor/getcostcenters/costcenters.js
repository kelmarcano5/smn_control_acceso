listboxClear("psl_centro_costo");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.psl_centro_costo.add(optionChoose, 0);

<psl_centro_costo_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.psl_centro_costo.add(option, 0);
</psl_centro_costo_rows>
