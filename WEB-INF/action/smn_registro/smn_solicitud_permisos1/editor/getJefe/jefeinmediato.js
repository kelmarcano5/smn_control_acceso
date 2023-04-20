listboxClear("spe_jefe_inmediato_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.spe_jefe_inmediato_rf.add(optionChoose, 0);

<spe_jefe_inmediato_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.spe_jefe_inmediato_rf.add(option, 0);
</spe_jefe_inmediato_rf_rows>
