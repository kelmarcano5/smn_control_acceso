listboxClear("smn_estructura_organizacional_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.smn_estructura_organizacional_rf.add(optionChoose, 0);

<smn_estructura_organizacional_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_estructura_organizacional_rf.add(option, 0);
</smn_estructura_organizacional_rf_rows>
