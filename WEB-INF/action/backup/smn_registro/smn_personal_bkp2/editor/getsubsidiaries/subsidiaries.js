listboxClear("psl_sucursal");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.psl_sucursal.add(optionChoose, 0);

<psl_sucursal_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.psl_sucursal.add(option, 0);
</psl_sucursal_rows>
