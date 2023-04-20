document.form1.tur_codigo.value='${fld:tur_codigo@js}';
document.form1.tur_nombre.value='${fld:tur_nombre@js}';
document.form1.id.value='${fld:smn_turnos_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tur_codigo.disabled=true;
 

