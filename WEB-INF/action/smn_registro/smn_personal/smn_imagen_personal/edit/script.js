setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
document.form1.imp_descripcion.value='${fld:imp_descripcion@js}';
document.form1.id.value='${fld:smn_imagen_personal_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

