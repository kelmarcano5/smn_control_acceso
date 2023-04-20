package procesos;

import dinamica.*;
import procesos.asistencia;
import procesos.horarios;

import javax.sql.DataSource;

//import org.apache.log4j.Logger;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.io.Console;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;



public class generarAsistencia extends GenericTransaction{
    public FileWriter crearArchivo(){
        FileWriter archivo = null;
//        File carpeta;
//        Sera asi static File newTextFile = new File("./log.txt")?
      try {
          archivo = new FileWriter("D:/data/Simone/smn_control_acceso/log/logGenerarAsistencia.txt",false);
//D:/data/Simone/smn_control_acceso/log
          System.out.println("CREANDO DIRECCTORIO...");
//        carpeta = new File("josdan.txt");

      } catch (Exception e) {
          System.err.println("E: "+e);
          
      }
      return archivo;

}

    
    
	public int service(Recordset inputParams) throws Throwable
	{
		//default return code
		int rc = 0;
		FileWriter fw = this.crearArchivo();
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		//reuse superclass code
		super.service(inputParams);
		
		//set request attributes in case of forward to another Action
		getRequest().setAttribute("idPlanAsistencia", inputParams.getString("idPlanAsistencia"));
	
	
		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
				
		try {
			
			fw.write(timestamp+"--INICIO DE PROCESO: --");	                	
	    	System.out.println("--INICIO DE PROCESO: --");

	    	
			//get db channel
			Db db = getDb();
			
			String sentenciaPlan = getSQL(getResource("query-buscarPlan.sql"), inputParams);
			//crea un recordset con la data obtenida
			Recordset rs = db.get(sentenciaPlan);
			
			
            horarios h = new horarios(fw);
            System.err.println(db);
            h.setDb(db);
            ArrayList<horarios> dias = h.listaHorarios(db);
            
        	if(dias.size()>0) {

                int c=0;
                int cDep = 0;
    			if(rs.getRecordCount() > 0) {
          			while(rs.next()){
          				c++;
           				asistencia objAsistencia = new asistencia();
           				objAsistencia.setFw(fw);
           				objAsistencia.setDb(db);
           				objAsistencia.setCnPostgre(conn);

						objAsistencia.generarAsitencia(rs.getString("smn_plan_asistencia_id"), rs.getInt("smn_esquema_rotacion_id"), rs.getInt("smn_estructura_organizacional_rf"), dias, rs.getString("cpa_fecha_desde_cal"), rs.getString("cpa_fecha_hasta_cal"));
          				
          			}
    				
    			}
    			fw.write(timestamp+"Cantidad de planes de asistencia leidos : "+(c));
				System.out.println("Cantidad de planes de asistencia leidos :"+c);

    			
        	}else {
				String m = "No encontro horarios en la tabla 'smn_gip.smn_horarios'";
				System.out.println(m);
				fw.write(timestamp+m);	                	

        	}
            


			
			
			
	    	
			
			
		
		} 
		catch (Throwable e)
		{
			throw e;
		}
		finally
		{
			if (conn!=null)
				conn.close();
		}
    	
		    System.out.println("--FIN DE PROCESO: --\n");
		    fw.write(timestamp+"--FIN DE PROCESO: --\n");	                	
		    fw.close();
		return rc;
	}
	
	
}
