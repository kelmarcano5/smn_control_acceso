listboxClear("psl_cargo");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.psl_cargo.add(optionChoose, 0);

<psl_cargo_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.psl_cargo.add(option, 0);
</psl_cargo_rows>
