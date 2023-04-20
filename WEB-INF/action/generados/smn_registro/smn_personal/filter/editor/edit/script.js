document.form1.psl_num_control.value='${fld:psl_num_control@js}';
setComboValue('psl_esquema_rotacion_rf','${fld:psl_esquema_rotacion_rf}','form1');
document.form1.psl_fecha_inicio_calculo.value='${fld:psl_fecha_inicio_calculo@dd-MM-yyyy}';
setComboValue('psl_categoria_personal_rf','${fld:psl_categoria_personal_rf}','form1');
setComboValue('psl_clase_auxiliar_rf','${fld:psl_clase_auxiliar_rf}','form1');
setComboValue('psl_auxiliar_rf','${fld:psl_auxiliar_rf}','form1');
setComboValue('psl_empresa_rf','${fld:psl_empresa_rf}','form1');
setComboValue('psl_sucursal_rf','${fld:psl_sucursal_rf}','form1');
setComboValue('psl_area_servicio_rf','${fld:psl_area_servicio_rf}','form1');
setComboValue('psl_unidad_servicio_rf','${fld:psl_unidad_servicio_rf}','form1');
setComboValue('psl_centro_costo_rf','${fld:psl_centro_costo_rf}','form1');
setComboValue('psl_estructura_organizacional_rf','${fld:psl_estructura_organizacional_rf}','form1');
setComboValue('psl_cargo_rf','${fld:psl_cargo_rf}','form1');
setComboValue('psl_categoria_cargo_rf','${fld:psl_categoria_cargo_rf}','form1');
setComboValue('psl_habilita_acceso_rf','${fld:psl_habilita_acceso_rf}','form1');
document.form1.psl_id_control_acceso.value='${fld:psl_id_control_acceso@js}';
document.form1.id.value='${fld:smn_personal_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

