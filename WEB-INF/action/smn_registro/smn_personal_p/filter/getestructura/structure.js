listboxClear("psl_estructura_organizacional_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.psl_estructura_organizacional_rf.add(optionChoose, 0);

<psl_estructura_organizacional_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.psl_estructura_organizacional_rf.add(option, 0);
</psl_estructura_organizacional_rf_rows>
