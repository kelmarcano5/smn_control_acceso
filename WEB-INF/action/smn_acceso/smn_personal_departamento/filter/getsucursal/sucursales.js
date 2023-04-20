listboxClear("psl_sucursal_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.psl_sucursal_rf.add(optionChoose, 0);

<psl_sucursal_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.psl_sucursal_rf.add(option, 0);
</psl_sucursal_rf_rows>
