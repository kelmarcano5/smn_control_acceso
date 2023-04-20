document.form1.rot_turno.value='${fld:rot_turno@js}';
document.form1.rot_consecutivo.value='${fld:rot_consecutivo@js}';
setComboValue('rot_dia','${fld:rot_dia}','form1');
document.form1.rot_horario.value='${fld:rot_horario@js}';
document.form1.id.value='${fld:smn_rotacion_turnos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

