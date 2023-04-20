var personal = '${fld:smn_personal_id}';
$('#smn_personal_id').val(personal).trigger('change');

var carnet = '${fld:rpv_numero_carnet_asignado}';
$('#rpv_numero_carnet_asignado').val(carnet).trigger('change');
//setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
// setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
// setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
// setComboValue('smn_estructura_organizacional_rf','${fld:smn_estructura_organizacional_rf}','form1');
// setComboValue('smn_cedula_rf','${fld:smn_cedula_rf}','form1');
document.form1.smn_entidad_rf.value='${fld:smn_entidad_rf@js}';
document.form1.smn_sucursal_rf.value='${fld:smn_sucursal_rf@js}';
document.form1.smn_estructura_organizacional_rf.value='${fld:smn_estructura_organizacional_rf@js}';
document.form1.smn_cedula_rf.value='${fld:smn_cedula_rf@#######}';

document.form1.rpv_fecha_evento.value='${fld:rpv_fecha_evento@dd-MM-yyyy}';
document.form1.rpv_razon_visita.value='${fld:rpv_razon_visita@js}';
setComboValue('rpv_autorizado_almorzar','${fld:rpv_autorizado_almorzar}','form1');
setComboValue('rpv_estatus','${fld:rpv_estatus}','form1');

//etComboValue('smn_codigo_variable_1','${fld:smn_codigo_variable_1}','form1');
//setComboValue('smn_codigo_variable_2','${fld:smn_codigo_variable_2}','form1');
document.form1.smn_valor_variable_2.value='${fld:smn_valor_variable_2@js}';
document.form1.smn_valor_variable_1.value='${fld:smn_valor_variable_1@js}';
setComboValue('rpv_autorizador','${fld:rpv_autorizador}','form1');
document.form1.id.value='${fld:smn_personal_visitantes_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

document.form1.smn_entidades_id.value='${fld:smn_entidades_id@#######}';
document.form1.smn_sucursales_id.value='${fld:smn_sucursales_id@#######}';
document.form1.smn_estructura_organizacional_id.value='${fld:smn_estructura_organizacional_id@#######}';

//document.form1.rpv_numero_carnet_asignado.value='${fld:rpv_numero_carnet_asignado@#######}';
//document.form1.rpv_hora_entrada.value=0;

document.form1.rpv_hora_entrada.value='${fld:rpv_hora_entrada@js}';
document.form1.rpv_hora_estimada_salida.value='${fld:rpv_hora_estimada_salida@js}';


var codigo1 = '${fld:smn_codigo_variable_1}';
$('#smn_codigo_variable_1').val(codigo1).trigger('change');
var codigo2 = '${fld:smn_codigo_variable_2}';
$('#smn_codigo_variable_2').val(codigo2).trigger('change');