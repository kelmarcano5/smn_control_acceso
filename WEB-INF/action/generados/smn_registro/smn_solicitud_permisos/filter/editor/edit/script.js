setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
setComboValue('spe_documento_rf','${fld:spe_documento_rf}','form1');
setComboValue('spe_categoria_justif_rf','${fld:spe_categoria_justif_rf}','form1');
document.form1.spe_fecha_desde.value='${fld:spe_fecha_desde@dd-MM-yyyy}';
document.form1.spe_fecha_hasta.value='${fld:spe_fecha_hasta@dd-MM-yyyy}';
document.form1.spe_cantidad_horas.value='${fld:spe_cantidad_horas@#,###,##0.00}';
setComboValue('spe_estatus_rf','${fld:spe_estatus_rf}','form1');
setComboValue('spe_jefe_inmediato_rf','${fld:spe_jefe_inmediato_rf}','form1');
document.form1.spe_detalles.value='${fld:spe_detalles@js}';
document.form1.spe_causa.value='${fld:spe_causa@js}';
document.form1.id.value='${fld:smn_solicitud_permisos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

