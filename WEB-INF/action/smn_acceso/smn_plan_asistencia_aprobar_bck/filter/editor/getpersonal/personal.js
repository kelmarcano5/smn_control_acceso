var elemento = window.document.getElementById('personal');
elemento.innerHTML="";

<personal_rows>

	var id = "${fld:personal_id}";
	var item = "${fld:item}";

	var fila ='<input name="personal_id" id="personal_id" type="checkbox" value="'+id+'" style="width:10px">'+item+'<br>';
				
    elemento.innerHTML += fila;
	
</personal_rows>