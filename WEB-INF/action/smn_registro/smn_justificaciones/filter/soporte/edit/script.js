document.form1.smn_justificaciones_id.value='${fld:smn_justificaciones_id@#,###,###}';
setComboValue('smn_personal_rf','${fld:smn_personal_rf}','form1');
document.form1.jsa_description.value='${fld:jsa_description@js}';
document.form1.id.value='${fld:smn_justificaciones_soporte_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

