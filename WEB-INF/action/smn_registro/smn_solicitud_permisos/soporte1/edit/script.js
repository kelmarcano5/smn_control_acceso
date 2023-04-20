document.form1.smn_solicitud_permisos_id_name.value='${fld:spe_estatus_rf_pl0@js}';
document.form1.smn_solicitud_permisos_id.value='${fld:smn_solicitud_permisos_id@#,###,###}';
setComboValue('pma_persona_ref','${fld:pma_persona_ref}','form1');
document.form1.id.value='${fld:smn_permisos_soporte_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

