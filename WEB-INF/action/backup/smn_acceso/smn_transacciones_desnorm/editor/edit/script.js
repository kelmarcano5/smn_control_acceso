document.form1.trd_sede.value='${fld:trd_sede@js}';
document.form1.trd_dispositivo.value='${fld:trd_dispositivo@js}';
document.form1.trd_identificacion.value='${fld:trd_identificacion@js}';
document.form1.trd_tipo_marcaje.value='${fld:trd_tipo_marcaje@js}';
document.form1.trd_fecha_transaccion.value='${fld:trd_fecha_transaccion@js}';
document.form1.trd_hora_transaccion.value='${fld:trd_hora_transaccion@js}';
document.form1.trd_tiempo_efectivo.value='${fld:trd_tiempo_efectivo@js}';
document.form1.trd_tiempo_efectivo_total.value='${fld:trd_tiempo_efectivo_total@#,###,##0.00}';
document.form1.trd_status.value='${fld:trd_status@js}';
document.form1.id.value='${fld:smn_transacciones_desnorm_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

