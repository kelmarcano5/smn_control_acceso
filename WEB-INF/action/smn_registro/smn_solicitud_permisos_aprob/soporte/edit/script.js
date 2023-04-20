document.form1.smn_solicitud_permisos_id.value='${fld:smn_solicitud_permisos_id@#,###,###}';
setComboValue('smn_persona_rf','${fld:smn_persona_rf}','form1');
document.form1.pma_description.value='${fld:pma_description@js}';
document.form1.id.value='${fld:smn_permisos_soporte_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

