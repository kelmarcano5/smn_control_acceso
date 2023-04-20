package generarAsistencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.DailyRollingFileAppender;

public class mainPlan {
	public static Connection cnPostgre;

	public static Connection getCnPostgre() {
		return cnPostgre;
	}
	public static void setCnPostgre(Connection cnPostgre) {
		mainPlan.cnPostgre = cnPostgre;
	}
	public final static Logger logger = Logger.getLogger(mainPlan.class);


	public static boolean conectarseaBD_Postgre() {
			boolean r = true;
	    	conexionPostgres mysql = new conexionPostgres();
	    	mainPlan.setCnPostgre(mysql.conectar());
		    if (mainPlan.getCnPostgre() == null) {
		        r = false;

	    		logger.info("_ *** Conexion NO establecida con ACCESS ***\n");
	    		logger.error(mysql.getError());
		    }
	    return r;
    }

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		///CONFIGURACIONES PARA EL LOGGER
		PatternLayout layout = new PatternLayout();
        String conversionPattern = "[%p] %d %c %M - %m%n";
        layout.setConversionPattern(conversionPattern);
        DailyRollingFileAppender rollingAppender = new DailyRollingFileAppender();
        rollingAppender.setFile("logGenerarAsistencia.log");
        rollingAppender.setDatePattern("'.'yyyy-MM-dd");
        rollingAppender.setLayout(layout);
        rollingAppender.activateOptions();
        Logger rootLogger = Logger.getRootLogger();
        rootLogger.setLevel(Level.DEBUG);
        rootLogger.addAppender(rollingAppender);
        boolean rst = mainPlan.conectarseaBD_Postgre();  
       	logger.info("--INICIO DE PROCESO: --");	                	
    	System.out.println("--INICIO DE PROCESO: --");	                	
       
        if(rst){
        	
//          String sentenciaPlanes =" select * from smn_control_acceso.smn_plan_asistencia";
         	String sentenciaPlanes =" select * from smn_control_acceso.smn_plan_asistencia where cpa_status='AP'";
         	Connection cn = mainPlan.getCnPostgre();
            horarios h = new horarios();
            ArrayList<horarios> dias = h.listaHorarios(cn);

        	if(dias.size()>0) {
            	try {
                   	Statement sql=null;
              		ResultSet rs=null;

              		sql=cn.createStatement();
                    rs=sql.executeQuery(sentenciaPlanes);
                    int c=0;
          			while(rs.next()){
          				c++;
           				asistencia objAsistencia = new asistencia();
           				objAsistencia.setCnPostgre(cn);
           				objAsistencia.generarAsitencia(rs.getString("smn_plan_asistencia_id"), rs.getInt("smn_esquema_rotacion_id"), rs.getInt("smn_estructura_organizacional_rf"), dias, rs.getString("cpa_fecha_desde_cal"), rs.getString("cpa_fecha_hasta_cal"));
          				
          			}
                	logger.info("Cantidad de planes de asistencia leidos : "+(c));

    			} catch (Exception e) {
					String m = "_Ha ocurrido un error al leer los datos en la tabla 'smn_control_acceso.smn_plan_asistencia'";
					logger.info(m);	                	
					logger.error("ERROR: "+e);	                	
    			}

        	
        	}else {
				String m = "No encontro horarios en la tabla 'smn_gip.smn_horarios'";
            	logger.error(m);	                	
        	}
        	
        }  
        System.out.println("--FIN DE PROCESO: --\n");
    	logger.info("--FIN DE PROCESO: --\n");	                	

	}

}
