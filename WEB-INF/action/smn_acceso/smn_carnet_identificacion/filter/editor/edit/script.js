document.form1.cid_codigo.value='${fld:cid_codigo@js}';
document.form1.cid_descripcion.value='${fld:cid_descripcion@js}';
setComboValue('cid_estatus','${fld:cid_estatus}','form1');
//document.form1.cid_estatus.value='${fld:cid_estatus@js}';
document.form1.cid_fecha_vigente.value='${fld:cid_fecha_vigente@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_carnet_identificacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.cid_codigo.disabled=true;
 

