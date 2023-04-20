document.form1.trm_sede.value='${fld:trm_sede@js}';
document.form1.trm_dispositivo.value='${fld:trm_dispositivo@js}';
document.form1.trm_identificacion.value='${fld:trm_identificacion@js}';
document.form1.trm_marcaje.value='${fld:trm_marcaje@js}';
setComboValue('trm_tipo_marcaje','${fld:trm_tipo_marcaje}','form1');
document.form1.trm_fecha_transaccion.value='${fld:trm_fecha_transaccion@dd-MM-yyyy}';
document.form1.trm_hora_transaccion.value='${fld:trm_hora_transaccion@js}';
document.form1.trm_jutificacion.value='${fld:trm_jutificacion@js}';
document.form1.id.value='${fld:smn_transacciones_manuales_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

