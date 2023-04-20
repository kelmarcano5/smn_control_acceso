setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
document.form1.spe_detalles.value='${fld:spe_detalles@js}';
setComboValue('spe_categoria_justif','${fld:spe_categoria_justif}','form1');
document.form1.spe_fecha_desde.value='${fld:spe_fecha_desde@dd-MM-yyyy}';
document.form1.spe_fecha_hasta.value='${fld:spe_fecha_hasta@dd-MM-yyyy}';
document.form1.spe_nro_horas.value='${fld:spe_nro_horas@#,###,##0.00}';
document.form1.spe_aprobado_por.value='${fld:spe_aprobado_por@js}';
document.form1.id.value='${fld:smn_solicitud_permisos_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

