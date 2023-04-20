setComboValue('mrk_documento_rf','${fld:mrk_documento_rf}','form1');
document.form1.mrk_sede.value='${fld:mrk_sede@js}';
setComboValue('mrk_empresa_rf','${fld:mrk_empresa_rf}','form1');
setComboValue('mrk_sucursal_rf','${fld:mrk_sucursal_rf}','form1');
setComboValue('mrk_area_servicio_rf','${fld:mrk_area_servicio_rf}','form1');
setComboValue('mrk_unidad_servicio_rf','${fld:mrk_unidad_servicio_rf}','form1');
setComboValue('mrk_centro_costo_rf','${fld:mrk_centro_costo_rf}','form1');
setComboValue('mrk_clase_auxiliar_rf','${fld:mrk_clase_auxiliar_rf}','form1');
setComboValue('mrk_auxiliar_rf','${fld:mrk_auxiliar_rf}','form1');
setComboValue('mrk_cargo_rf','${fld:mrk_cargo_rf}','form1');
setComboValue('mrk_categoria_cargo_rf','${fld:mrk_categoria_cargo_rf}','form1');
document.form1.mrk_control_acceso_id.value='${fld:mrk_control_acceso_id@js}';
document.form1.mrk_dispositivo_codigo.value='${fld:mrk_dispositivo_codigo@js}';
document.form1.mrk_marcaje_id.value='${fld:mrk_marcaje_id@js}';
document.form1.mrk_marcaje_fecha.value='${fld:mrk_marcaje_fecha@dd-MM-yyyy}';
document.form1.mrk_marcaje_hora.value='${fld:mrk_marcaje_hora@js}';
setComboValue('mrk_marcaje_dia_rf','${fld:mrk_marcaje_dia_rf}','form1');
setComboValue('mrk_marcaje_tipo_rf','${fld:mrk_marcaje_tipo_rf}','form1');
document.form1.mrk_turno_rf.value='${fld:mrk_turno_rf@#,###,###}';
document.form1.mrk_consecutivo.value='${fld:mrk_consecutivo@js}';
document.form1.mrk_transaccion_rf.value='${fld:mrk_transaccion_rf@#,###,###}';
document.form1.mrk_horas_retrasos.value='${fld:mrk_horas_retrasos@#,###,##0.00}';
document.form1.mrk_horas_ausencias.value='${fld:mrk_horas_ausencias@#,###,##0.00}';
document.form1.mrk_horas_descanso.value='${fld:mrk_horas_descanso@#,###,##0.00}';
document.form1.id.value='${fld:smn_mov_marcajes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.mrk_dispositivo_codigo.disabled=true;
 

