listboxClear("dis_sucursal");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.dis_sucursal.add(optionChoose, 0);

<dis_sucursal_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.dis_sucursal.add(option, 0);
</dis_sucursal_rows>
