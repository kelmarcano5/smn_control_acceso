setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
setComboValue('smn_esquema_rotacion_actual_rf','${fld:smn_esquema_rotacion_actual_rf}','form1');
setComboValue('smn_esquema_rotacion_nuevo_rf','${fld:smn_esquema_rotacion_nuevo_rf}','form1');
document.form1.id.value='${fld:smn_control_esquema_rotacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

