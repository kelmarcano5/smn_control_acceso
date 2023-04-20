var list = document.getElementById("detalle");
console.log(list);
document.getElementById("smn_control_vacaciones_id").remove();
for(var i = (list.getElementsByTagName('input').length + list.getElementsByTagName('span').length + list.getElementsByTagName('br').length) - 1; 0 <= i; i--)
	

<smn_control_vacaciones_id_rows>



var checkbox = document.createElement('input');
checkbox.type = "checkbox";
checkbox.name = "smn_control_vacaciones_id";
checkbox.id = "smn_control_vacaciones_id";
checkbox.type = "checkbox";
checkbox.checked = false;
checkbox.value = "${fld:smn_control_vacaciones_id}";
checkbox.style = "width: 10px";
checkbox.setAttribute("onclick","javascript:sumar('detalle','${fld:cva_cantidad_dias_pendientes}',(this));");

var span = document.createElement('span')
span.id = "smn_control_vacaciones_id";
span.appendChild(document.createTextNode(' ${fld:cva_periodo_desde} | - | ${fld:cva_periodo_hasta} | ${fld:cva_cantidad_dias_pendientes} dias'));

var br = document.createElement('br');
br.id = "smn_control_vacaciones_id";

detalle.appendChild(checkbox);
detalle.appendChild(span);
detalle.appendChild(br);

</smn_control_vacaciones_id_rows>


