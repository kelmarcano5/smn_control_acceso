setComboValue('igs_auxiliar','${fld:igs_auxiliar}','form1');
setComboValue('igs_clase_auxiliar','${fld:igs_clase_auxiliar}','form1');
document.form1.igs_control_acceso_id.value='${fld:igs_control_acceso_id@js}';
setComboValue('igs_actividad','${fld:igs_actividad}','form1');
document.form1.igs_tiempo_efectivo.value='${fld:igs_tiempo_efectivo@#,###,##0.00}';
document.form1.igs_fecha.value='${fld:igs_fecha@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_resumen_marcajes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

