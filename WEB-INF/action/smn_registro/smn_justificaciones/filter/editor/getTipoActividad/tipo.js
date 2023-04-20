listboxClear("jus_tipo_actividad_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.jus_tipo_actividad_rf.add(optionChoose, 0);

<jus_tipo_actividad_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.jus_tipo_actividad_rf.add(option, 0);
</jus_tipo_actividad_rf_rows>
