listboxClear("personal");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.personal.add(optionChoose, 0);

<personal_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.personal.add(option, 0);
</personal_rows>
