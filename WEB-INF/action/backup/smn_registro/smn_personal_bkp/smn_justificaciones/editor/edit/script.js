setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
document.form1.jus_descripcion.value='${fld:jus_descripcion@js}';
document.form1.jus_fecha_incidencia.value='${fld:jus_fecha_incidencia@dd-MM-yyyy}';
document.form1.jus_hora_incidencia.value='${fld:jus_hora_incidencia@js}';
document.form1.jus_tiempo_a_justificar.value='${fld:jus_tiempo_a_justificar@#,###,##0.00}';
document.form1.jus_aprobado_por.value='${fld:jus_aprobado_por@js}';
document.form1.id.value='${fld:smn_justificaciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

