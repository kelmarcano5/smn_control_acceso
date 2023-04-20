package clases;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import org.apache.log4j.Appender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.PropertyConfigurator;

public class marcajesMain {
	public static void main(String[] args){

	       PatternLayout layout = new PatternLayout();
	        String conversionPattern = "[%p] %d %c %M - %m%n";
	        layout.setConversionPattern(conversionPattern);
	 
	        // creates daily rolling file appender
	        DailyRollingFileAppender rollingAppender = new DailyRollingFileAppender();
	        rollingAppender.setFile("logAccessSimone.log");
	        rollingAppender.setDatePattern("'.'yyyy-MM-dd");
	        rollingAppender.setLayout(layout);
	        rollingAppender.activateOptions();
	 
	        // configures the root logger
	        Logger rootLogger = Logger.getRootLogger();
	        rootLogger.setLevel(Level.DEBUG);
	        rootLogger.addAppender(rollingAppender);
	 
	        // creates a custom logger and log messages
//	        Logger logger = Logger.getLogger(ProgrammaticDailyRollingLogFilesExample.class);
		
  		Checkinout ch = new Checkinout();
  		
  		//TRAZA
		String fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			
		String mInicio = "\t\tComieza registro de Access_A_Simone: "+fechaActual+"\n";
		ch.imprimirEnLog(mInicio);
		//
		System.out.println(mInicio);
 
		try {
			ch.leerDatosAccess();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("_NO -> "+e);
			
//			e.printStackTrace();
			ch.imprimirEnLog("No se a relizado el proceso exitosamente");
//			ch.imprimirEnLog(e.toString());
		}
		
		fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			
		 String mFinal = "\tFinaliza registro de Access_A_Simone: "+fechaActual+"\n\n";
		ch.imprimirEnLog(mFinal);
		System.out.println(mFinal);
		System.exit(0);
	}
	
}
