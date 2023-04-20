document.form1.smn_justificaciones_id_name.value='${fld:jus_estatus_rf_pl0@js}';
document.form1.smn_justificaciones_id.value='${fld:smn_justificaciones_id@#,###,###}';
setComboValue('jsa_persona_rf','${fld:jsa_persona_rf}','form1');
document.form1.id.value='${fld:smn_justificaciones_soporte_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

