setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
// setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
// setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
// setComboValue('smn_estructura_organizacional_rf','${fld:smn_estructura_organizacional_rf}','form1');
// setComboValue('smn_cedula_rf','${fld:smn_cedula_rf}','form1');
document.form1.rpv_fecha_evento.value='${fld:rpv_fecha_evento@dd-MM-yyyy}';
document.form1.rpv_razon_visita.value='${fld:rpv_razon_visita@js}';
setComboValue('rpv_autorizado_almorzar','${fld:rpv_autorizado_almorzar}','form1');
document.form1.rpv_autorizador.value='${fld:rpv_autorizador@#,###,###}';
setComboValue('rpv_estatus','${fld:rpv_estatus}','form1');
document.form1.rpv_fecha_registro.value='${fld:rpv_fecha_registro@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_personal_visitantes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

