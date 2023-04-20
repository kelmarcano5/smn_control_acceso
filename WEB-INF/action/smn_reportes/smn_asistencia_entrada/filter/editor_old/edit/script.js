document.form1.smn_plan_asistencia_id.value='${fld:smn_plan_asistencia_id@#,###,###}';
document.form1.asi_id_control_acceso.value='${fld:asi_id_control_acceso@js}';
setComboValue('asi_personal_rf','${fld:asi_personal_rf}','form1');
document.form1.asi_fecha_evento.value='${fld:asi_fecha_evento@dd-MM-yyyy}';
document.form1.asi_dia_evento.value='${fld:asi_dia_evento@js}';
document.form1.asi_turno_rf.value='${fld:asi_turno_rf@#,###,###}';
document.form1.asi_esquema_rotacion_rf.value='${fld:asi_esquema_rotacion_rf@#,###,###}';
setComboValue('asi_tipo_marcaje','${fld:asi_tipo_marcaje}','form1');
document.form1.asi_hora_tope_evento.value='${fld:asi_hora_tope_evento@js}';
setComboValue('asi_estatus_permiso_rf','${fld:asi_estatus_permiso_rf}','form1');
setComboValue('asi_estatus_asistencia_rf','${fld:asi_estatus_asistencia_rf}','form1');
document.form1.asi_hora_marcaje.value='${fld:asi_hora_marcaje@js}';
document.form1.asi_estatus_marcaje.value='${fld:asi_estatus_marcaje@js}';
document.form1.asi_secuencia_tipo_marcaje.value='${fld:asi_secuencia_tipo_marcaje@#,###,###}';
setComboValue('smn_codigo_variable_1','${fld:smn_codigo_variable_1}','form1');
setComboValue('asi_variable_1','${fld:asi_variable_1}','form1');
setComboValue('smn_codigo_variable_2','${fld:smn_codigo_variable_2}','form1');
setComboValue('asi_variable_1','${fld:asi_variable_1}','form1');
document.form1.id.value='${fld:smn_asistencia_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

