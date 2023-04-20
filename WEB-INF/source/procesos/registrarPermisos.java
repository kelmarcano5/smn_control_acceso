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



public class registrarPermisos extends GenericTransaction{
    public FileWriter crearArchivo(){
        FileWriter archivo = null;
//        File carpeta;
//        Sera asi static File newTextFile = new File("./log.txt")?
      try {
          archivo = new FileWriter("logRegistrarPermisos.txt",false);
//D:/data/Simone/smn_control_acceso/logD:/data/Simone/smn_control_acceso/log/logGenerarAsistencia.txt
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
		int c=0;
//		FileWriter fw = this.crearArchivo();
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		//reuse superclass code
		super.service(inputParams);
		
		//set request attributes in case of forward to another Action
		// getRequest().setAttribute("idPlanAsistencia", inputParams.getString("idPlanAsistencia"));
		// getRequest().setAttribute("usuario", inputParams.getString("usuario"));
		// String usuario = inputParams.getString("usuario");
		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
				
		try {
			
//			fw.write(timestamp+"--INICIO DE PROCESO: --");	                	
	    	System.out.println("--INICIO DE PROCESO: --");

	    	
			//get db channel
			Db db = getDb();
			int permiso_id=0;
			int cant_dias_sol=0;
			String sentenciaInsert = getSQL(getResource("insert.sql"), inputParams);
			//crea un recordset con la data obtenida
			Recordset rs = db.get(sentenciaInsert);
			
    			if(rs.getRecordCount() > 0) {
          			while(rs.next()){
          				permiso_id=rs.getInteger("smn_solicitud_permisos_id");
          				cant_dias_sol=rs.getInteger("spe_cantidad_dias");
          				inputParams.setValue("smn_solicitud_permisos_id", permiso_id);
          				c++;
          				String sgetvac = getSQL(getResource("query-getvacaciones.sql"), inputParams);
          				Recordset rs2 = db.get(sgetvac);
          				int vacacion_id=0;
          				int cantidad_dias_pend=0;
            			if(rs2.getRecordCount() > 0) {
                  			while(rs2.next()){
                  				vacacion_id=rs2.getInteger("smn_control_vacaciones_id");
                  				inputParams.setValue("smn_control_vacaciones", vacacion_id);
                  				cantidad_dias_pend=rs2.getInteger("cva_cantidad_dias_pendientes");
                  				if(cant_dias_sol==cantidad_dias_pend){
                  					inputParams.setValue("spe_cantidad_dias", cant_dias_sol);
                  					String updcontrol = getSQL(getResource("update_control_vacaciones.sql"), inputParams);
            						db.exec(updcontrol);
            						cant_dias_sol=0;
                  				}else{
                  					if(cant_dias_sol>cantidad_dias_pend){
                  						inputParams.setValue("spe_cantidad_dias", cant_dias_sol);
                      					String updcontrol = getSQL(getResource("update_control_vacaciones.sql"), inputParams);
                						db.exec(updcontrol);
                						cant_dias_sol=cant_dias_sol-cantidad_dias_pend;
                      				}else{
                      					if(cant_dias_sol<cantidad_dias_pend){
                      						inputParams.setValue("spe_cantidad_dias", cant_dias_sol);
                          					String updcontrol = getSQL(getResource("update_control_vacaciones.sql"), inputParams);
                    						db.exec(updcontrol);
                    						cant_dias_sol=0;
                          				}
                      				}
                  					}
                  				String inscontrol = getSQL(getResource("insert_rel_control_vacac_permis.sql"), inputParams);
        						db.exec(inscontrol);
                  				}
                  			}
          			}
    				
    			}
//    			fw.write(timestamp+"Cantidad de planes de asistencia leidos : "+(c));
				System.out.println("Cantidad de planes de asistencia leidos :"+c);

    			
        	
            		
		
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
//		    fw.write(timestamp+"--FIN DE PROCESO: --\n");	                	
//		    fw.close();
		return rc;
	}
	
}
