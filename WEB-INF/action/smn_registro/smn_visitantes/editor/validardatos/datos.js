var nombre = '${fld:nombre}';
var apellido = '${fld:apellido}';
var empresa = '${fld:empresa}';

document.getElementById("vis_nombre").value=nombre;
document.getElementById("vis_nombre").disabled=true;

document.getElementById("vis_apellido").value=apellido;
document.getElementById("vis_apellido").disabled=true;

document.getElementById("vis_empresa").value=empresa;
document.getElementById("vis_empresa").disabled=true;