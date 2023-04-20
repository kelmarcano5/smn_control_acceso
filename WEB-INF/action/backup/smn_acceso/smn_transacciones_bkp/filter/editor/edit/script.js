document.form1.trn_dispositivo.value='${fld:trn_dispositivo@js}';
document.form1.trn_identificacion.value='${fld:trn_identificacion@js}';
document.form1.trn_fecha_transaccion.value='${fld:trn_fecha_transaccion@dd-MM-yyyy}';
document.form1.trn_hora_transaccion.value='${fld:trn_hora_transaccion@js}';
document.form1.id.value='${fld:smn_transacciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

