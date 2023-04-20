document.form1.dis_codigo.value='${fld:dis_codigo@js}';
document.form1.dis_nombre.value='${fld:dis_nombre@js}';
setComboValue('dis_empresa','${fld:dis_empresa}','form1');
setComboValue('dis_sucursal','${fld:dis_sucursal}','form1');
setComboValue('dis_area_servicio','${fld:dis_area_servicio}','form1');
setComboValue('dis_unidad_servicio','${fld:dis_unidad_servicio}','form1');
setComboValue('dis_tipo_dispositivo','${fld:dis_tipo_dispositivo}','form1');
document.form1.dis_serial.value='${fld:dis_serial@js}';
document.form1.dis_ip_address.value='${fld:dis_ip_address@js}';
document.form1.id.value='${fld:smn_dispositivos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

