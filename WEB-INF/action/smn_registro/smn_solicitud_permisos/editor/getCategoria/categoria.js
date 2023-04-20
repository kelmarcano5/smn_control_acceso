listboxClear("spe_categoria_justif_rf");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";
document.form1.spe_categoria_justif_rf.add(optionChoose, 0);

<spe_categoria_justif_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.spe_categoria_justif_rf.add(option, 0);
</spe_categoria_justif_rf_rows>
