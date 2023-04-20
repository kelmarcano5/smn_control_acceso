listboxClear("mrk_centro_costo_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.mrk_centro_costo_rf.add(optionChoose, 0);

<mrk_centro_costo_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.mrk_centro_costo_rf.add(option, 0);
</mrk_centro_costo_rf_rows>
