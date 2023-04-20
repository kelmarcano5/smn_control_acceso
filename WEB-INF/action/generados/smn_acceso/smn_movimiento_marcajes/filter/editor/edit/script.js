setComboValue('mrk_auxiliar','${fld:mrk_auxiliar}','form1');
setComboValue('mrk_clase_auxiliar','${fld:mrk_clase_auxiliar}','form1');
document.form1.mrk_control_acceso_id.value='${fld:mrk_control_acceso_id@js}';
setComboValue('mrk_empresa','${fld:mrk_empresa}','form1');
setComboValue('mrk_sucursal','${fld:mrk_sucursal}','form1');
setComboValue('mrk_area_servicio','${fld:mrk_area_servicio}','form1');
setComboValue('mrk_unidad_servicio','${fld:mrk_unidad_servicio}','form1');
setComboValue('mrk_centro_costo','${fld:mrk_centro_costo}','form1');
setComboValue('mrk_cargo','${fld:mrk_cargo}','form1');
setComboValue('mrk_categoria_cargo','${fld:mrk_categoria_cargo}','form1');
document.form1.mrk_marcaje_id.value='${fld:mrk_marcaje_id@js}';
document.form1.mrk_dispositivo_codigo.value='${fld:mrk_dispositivo_codigo@js}';
document.form1.mrk_marcaje_fecha.value='${fld:mrk_marcaje_fecha@dd-MM-yyyy}';
document.form1.mrk_marcaje_hora.value='${fld:mrk_marcaje_hora@js}';
setComboValue('mrk_marcaje_dia','${fld:mrk_marcaje_dia}','form1');
setComboValue('mrk_marcaje_tipo','${fld:mrk_marcaje_tipo}','form1');
document.form1.mrk_tiempo_efectivo.value='${fld:mrk_tiempo_efectivo@#,###,##0.00}';
document.form1.mrk_turno.value='${fld:mrk_turno@#,###,###}';
document.form1.mrk_consecutivo.value='${fld:mrk_consecutivo@js}';
document.form1.id.value='${fld:smn_movimiento_marcajes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

