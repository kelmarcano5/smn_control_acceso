setComboValue('smn_empresa_rf','${fld:smn_empresa_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_estructura_organizacional_rf','${fld:smn_estructura_organizacional_rf}','form1');
setComboValue('smn_esquema_rotacion_id','${fld:smn_esquema_rotacion_id}','form1');
document.form1.cpa_fecha_desde_cal.value='${fld:cpa_fecha_desde_cal@dd-MM-yyyy}';
document.form1.cpa_fecha_hasta_cal.value='${fld:cpa_fecha_hasta_cal@dd-MM-yyyy}';
document.form1.cpa_fecha_generado.value='${fld:cpa_fecha_generado@dd-MM-yyyy}';
document.form1.cpa_ano.value='${fld:cpa_ano@#,###,###}';
document.form1.cpa_num_semana_ini.value='${fld:cpa_num_semana_ini@#,###,###}';
document.form1.cpa_num_semana_fin.value='${fld:cpa_num_semana_fin@#,###,###}';
document.form1.cpa_fecha_vigencia.value='${fld:cpa_fecha_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_plan_asistencia_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

