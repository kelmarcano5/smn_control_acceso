listboxClear("asi_personal_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.asi_personal_rf.add(optionChoose, 0);

<asi_personal_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.asi_personal_rf.add(option, 0);
</asi_personal_rf_rows>
