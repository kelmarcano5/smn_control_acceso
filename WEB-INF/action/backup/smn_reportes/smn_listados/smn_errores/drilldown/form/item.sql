select  
	trans_estatus.id,  
	trans_estatus.descripcion 
from   
	(select    
		row_number() over() as id,   
		smn_control_acceso.smn_transacciones_desnorm.trd_status as descripcion,   
		count(*) as total  
	 from   
		smn_control_acceso.smn_transacciones_desnorm    	
	 group by   
		smn_control_acceso.smn_transacciones_desnorm.trd_status) trans_estatus 
where  
	trans_estatus.id = ${fld:id}