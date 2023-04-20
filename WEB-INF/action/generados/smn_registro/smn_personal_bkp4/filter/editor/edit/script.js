document.form1.psl_num_control.value='${fld:psl_num_control@js}';
setComboValue('psl_grupo','${fld:psl_grupo}','form1');
document.form1.psl_grupo_fecha_inicio.value='${fld:psl_grupo_fecha_inicio@dd-MM-yyyy}';
setComboValue('psl_clase_auxiliar','${fld:psl_clase_auxiliar}','form1');
setComboValue('psl_auxiliar','${fld:psl_auxiliar}','form1');
setComboValue('psl_empresa','${fld:psl_empresa}','form1');
setComboValue('psl_sucursal','${fld:psl_sucursal}','form1');
setComboValue('psl_area_servicio','${fld:psl_area_servicio}','form1');
setComboValue('psl_unidad_servicio','${fld:psl_unidad_servicio}','form1');
setComboValue('psl_centro_costo','${fld:psl_centro_costo}','form1');
setComboValue('psl_estructura_organiz','${fld:psl_estructura_organiz}','form1');
setComboValue('psl_cargo','${fld:psl_cargo}','form1');
setComboValue('psl_categoria_cargo','${fld:psl_categoria_cargo}','form1');
setComboValue('psl_habilita_acceso','${fld:psl_habilita_acceso}','form1');
document.form1.psl_id_control_acceso.value='${fld:psl_id_control_acceso@js}';
document.form1.id.value='${fld:smn_personal_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

