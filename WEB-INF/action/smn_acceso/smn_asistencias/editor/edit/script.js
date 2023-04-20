document.form1.asi_id_control_acceso.value='${fld:asi_id_control_acceso@js}';
setComboValue('asi_clase_auxiliar_rf','${fld:asi_clase_auxiliar_rf}','form1');
setComboValue('asi_auxiliar_rf','${fld:asi_auxiliar_rf}','form1');
document.form1.asi_fecha.value='${fld:asi_fecha@dd-MM-yyyy}';
setComboValue('asi_estatus_permiso_rf','${fld:asi_estatus_permiso_rf}','form1');
setComboValue('asi_turno_rf','${fld:asi_turno_rf}','form1');
setComboValue('asi_esquema_rotacion_rf','${fld:asi_esquema_rotacion_rf}','form1');
document.form1.asi_hora_ent_turno1.value='${fld:asi_hora_ent_turno1@js}';
document.form1.asi_hora_sal_turno1.value='${fld:asi_hora_sal_turno1@js}';
document.form1.asi_hora_ent_turno2.value='${fld:asi_hora_ent_turno2@js}';
document.form1.asi_hora_sal_turno2.value='${fld:asi_hora_sal_turno2@js}';
document.form1.asi_horas_trabajadas.value='${fld:asi_horas_trabajadas@#,###,##0.00}';
document.form1.asi_horas_descansos.value='${fld:asi_horas_descansos@#,###,##0.00}';
setComboValue('asi_estatus_asistencia_rf','${fld:asi_estatus_asistencia_rf}','form1');
document.form1.id.value='${fld:smn_asistencias_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

