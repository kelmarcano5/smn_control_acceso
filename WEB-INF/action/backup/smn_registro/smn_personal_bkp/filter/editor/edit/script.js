document.form1.psl_num_control.value='${fld:psl_num_control@js}';
setComboValue('psl_clase_auxiliar','${fld:psl_clase_auxiliar}','form1');
setComboValue('psl_auxiliar','${fld:psl_auxiliar}','form1');
setComboValue('psl_habilita_acceso','${fld:psl_habilita_acceso}','form1');
document.form1.psl_id_control_acceso.value='${fld:psl_id_control_acceso@js}';
document.form1.id.value='${fld:smn_personal_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

