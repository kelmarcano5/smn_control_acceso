setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
setComboValue('jus_tipo_actividad_rf','${fld:jus_tipo_actividad_rf}','form1');
setComboValue('jus_documento_rf','${fld:jus_documento_rf}','form1');
document.form1.jus_fecha_incidencia.value='${fld:jus_fecha_incidencia@dd-MM-yyyy}';
document.form1.jus_hora_incidencia.value='${fld:jus_hora_incidencia@js}';
document.form1.jus_tiempo_a_justificar.value='${fld:jus_tiempo_a_justificar@#,###,##0.00}';
setComboValue('jus_estatus_rf','${fld:jus_estatus_rf}','form1');
setComboValue('jus_jefe_inmediato_rf','${fld:jus_jefe_inmediato_rf}','form1');
document.form1.jus_descripcion.value='${fld:jus_descripcion@js}';
document.form1.jus_causa.value='${fld:jus_causa@js}';
document.form1.id.value='${fld:smn_justificaciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

