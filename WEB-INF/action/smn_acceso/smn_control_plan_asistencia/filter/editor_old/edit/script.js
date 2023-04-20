setComboValue('smn_empresa_rf','${fld:smn_empresa_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_estructura_organizacional_rf','${fld:smn_estructura_organizacional_rf}','form1');
setComboValue('smn_personal_id','${fld:smn_personal_id}','form1');
document.form1.cpa_ano .value='${fld:cpa_ano @#,###,##0.00}';
document.form1.cpa_num_semana_ini_id.value='${fld:cpa_num_semana_ini_id@#,###,###}';
document.form1.cpa_num_semana_fin_id.value='${fld:cpa_num_semana_fin_id@#,###,###}';
document.form1.cpa_fecha_desde_calc.value='${fld:cpa_fecha_desde_calc@dd-MM-yyyy}';
document.form1.cpa_fecha_hasta_calc.value='${fld:cpa_fecha_hasta_calc@dd-MM-yyyy}';
document.form1.cpa_fecha_generado.value='${fld:cpa_fecha_generado@dd-MM-yyyy}';
setComboValue('cpa_status','${fld:cpa_status}','form1');
document.form1.cpa_fecha_vigencia.value='${fld:cpa_fecha_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_control_plan_asistencia_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

