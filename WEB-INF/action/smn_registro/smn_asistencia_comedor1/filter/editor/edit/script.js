setComboValue('smn_asistencia_id','${fld:smn_asistencia_id}','form1');
setComboValue('smn_movimiento_marcaje_id','${fld:smn_movimiento_marcaje_id}','form1');
setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
document.form1.com_fecha_generada.value='${fld:com_fecha_generada@dd-MM-yyyy}';
document.form1.com_hora_generada.value='${fld:com_hora_generada@js}';
document.form1.com_hora_marcaje.value='${fld:com_hora_marcaje@js}';
document.form1.com_hora_entregada.value='${fld:com_hora_entregada@js}';
setComboValue('com_estatus','${fld:com_estatus}','form1');
document.form1.id.value='${fld:smn_asistencia_comedor_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

