setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_estructura_organizativa_rf','${fld:smn_estructura_organizativa_rf}','form1');
setComboValue('smn_tipo_documento_identidad_rf','${fld:smn_tipo_documento_identidad_rf}','form1');
document.form1.vis_documento_identidad.value='${fld:vis_documento_identidad@#######}';
document.form1.vis_nombre.value='${fld:vis_nombre@js}';
document.form1.vis_apellido.value='${fld:vis_apellido@js}';
document.form1.vis_empresa.value='${fld:vis_empresa@js}';
document.form1.smn_numero_carnet_asignado_id.value='${fld:smn_numero_carnet_asignado_id@#,###,###}';
document.form1.vis_hora_entrada.value='${fld:vis_hora_entrada@js}';
document.form1.vis_hora_estimada_salida.value='${fld:vis_hora_estimada_salida@js}';
setComboValue('vis_invitado_almuerzo','${fld:vis_invitado_almuerzo}','form1');
setComboValue('vis_estatus','${fld:vis_estatus}','form1');
//setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
//document.form1.smn_personal_id.value='${fld:smn_personal_id@#,###,###}';
document.form1.vis_fecha_vigencia.value='${fld:vis_fecha_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_visitantes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

var codigo1 = '${fld:smn_codigo_variable_1}';
$('#smn_codigo_variable_1').val(codigo1).trigger('change');
var codigo2 = '${fld:smn_codigo_variable_2}';
$('#smn_codigo_variable_2').val(codigo2).trigger('change');

var personal = '${fld:smn_personal_id}';
$('#smn_personal_id').val(personal).trigger('change');
 

