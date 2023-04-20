package ComparativoMarcaje;

import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;

import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;

import ComparativoMarcaje.conexionPostgres;
import ComparativoMarcaje.horarios;

public class main {

		public final static Logger logger = Logger.getLogger(main.class);

	public static Connection cnPostgre;

	public static String primerYUltimo_plan_asistencias_leidas="0-0";
	

	
	public static Connection getCnPostgre() {
		return cnPostgre;
	}

	public static void setCnPostgre(Connection cnPostgre) {
		main.cnPostgre = cnPostgre;
	}

	
	public static String getPrimerYUltimo_plan_asistencias_leidas() {
		return primerYUltimo_plan_asistencias_leidas;
	}

	public static void setPrimerYUltimo_plan_asistencias_leidas(String primerYUltimo_plan_asistencias_leidas) {
		main.primerYUltimo_plan_asistencias_leidas = primerYUltimo_plan_asistencias_leidas;
	}

	public static boolean conectarseaBD_Postgre() {
			boolean r = true;
	    	conexionPostgres mysql = new conexionPostgres();
	    	main.setCnPostgre(mysql.conectar());
		    if (main.getCnPostgre() == null) {
		        r = false;
/*
 	    		logger.info("_ *** Conexion NO establecida con ACCESS ***\n");
	    		logger.error(mysql.getError());
*/
		    }else {
//		        main.setPrimerYUltimo_plan_asistencias_leidas(mysql.getInicioFin_asistenciasLeidas());
		    }
	    return r;
    }// FIN CONECTAR POSTGRESS

	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        String fechaActualC = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			
        String[] partesfechaActual = fechaActualC.split(" ");
        String  fechaActual = partesfechaActual[0];     			
        String  horaActual = partesfechaActual[1];
        //		String diaAnterior = clacularFechas(fechaActual);

/*
			System.out.println(senteciaPrincipal);
			System.out.println(sentenciaSecundaria);
*/
		///CONFIGURACIONES PARA EL LOGGER
			PatternLayout layout = new PatternLayout();
	        String conversionPattern = "[%p] %d %c %M - %m%n";
	        layout.setConversionPattern(conversionPattern);
	        DailyRollingFileAppender rollingAppender = new DailyRollingFileAppender();
	        rollingAppender.setFile("logComparativoMarcaje.log");
	        rollingAppender.setDatePattern("'.'yyyy-MM-dd");
	        rollingAppender.setLayout(layout);
	        rollingAppender.activateOptions();
	        Logger rootLogger = Logger.getRootLogger();
	        rootLogger.setLevel(Level.DEBUG);
	        rootLogger.addAppender(rollingAppender);
	        boolean rst = main.conectarseaBD_Postgre();  
	       	logger.info("--INICIO DE PROCESO: --");	                	
	    	System.out.println("--INICIO DE PROCESO: --");	                	
	    	if(rst){
	    		
	    		Connection cn = main.getCnPostgre();
	    		
	    		String[] diaAnteriorPartes = fechaActual.split("-"); //FORMATO => AAAA-MM-DD  
	    		
	    		String nombreDia = QueDiaSemana(entero(diaAnteriorPartes[0]),entero(diaAnteriorPartes[1]),entero(diaAnteriorPartes[2]));

//	    		String primerUltimaAsis_nueva = "0-0";
	    		
	    		
//	    		String[] ultimasAisitenciasLeidasPartes = main.getPrimerYUltimo_plan_asistencias_leidas().split("-"); //FORMATO => ini-fin // integers
//	    		System.out.println("ULTIMA ASISTENCIAS LEIDAS: DESDE "+ultimasAisitenciasLeidasPartes[0]+" HASTA-> "+ultimasAisitenciasLeidasPartes[1]);
	    		System.out.println("DIA: ("+fechaActual+") -> "+nombreDia);
    			System.out.println("HORA: ("+horaActual+")");

    			horarios h = new horarios();
                ArrayList<horarios> dias = h.listaHorarios(cn);
            	if(dias.size()>0) {
    				asistencia asistencia_obj = new asistencia();
    	            ArrayList<asistencia> asistencias = asistencia_obj.listaAsistencias(cn, fechaActual);
    	            ArrayList<String[]> listaIndividual= new ArrayList<String[]>();
    	            ArrayList<String[]> listaIndividual_All = new ArrayList<String[]>();

    	            String fechaIni = "0000-00-00";
    	            String fechaFin = "0000-00-00";
    	            String fechaIniH = "0000-00-00 00:00";
    	            String fechaFinH = "0000-00-00 00:00";
    	            
    	            /////////////////////////////////////////////////
    	            /*
    	             * PASO 4: ELIMINAR LAS ASISTENCIAS QUE NO SE DEBEN TOMAR EN CUENTA 
    	             * PORQUE NO A LLEGADO LA FECHA 
    	             * O LA HORA NO ES TODABIA (osea es mas temprano )
    	             * */
    	            ArrayList<asistencia> asistenciaAntesDeHoyYAhora =  asistencia_obj.desecharSuperiores(asistencias, fechaActualC);

    	            asistencias.clear();
    	            asistencias = asistenciaAntesDeHoyYAhora;

   	            
    	            if(asistencias.size()>0){
    	            	System.out.println("Cantida de Asistencias programadas ="+asistencias.size());	                	

        	            if(asistenciaAntesDeHoyYAhora.size()>0) {//ESTE IF CREO QUE ES UNA TONTERIA

        	            	
        	            	
        	            	
        	            	asistencia prm = asistencias.get(0);
        					asistencia ult = asistencias.get(asistencias.size()-1);
        					fechaIni = prm.getFechaEvento();
        	            	fechaFin = ult.getFechaEvento();

        	            	fechaIniH = prm.getFechaEvento()+" "+prm.getHoraTopeEvento();
        	            	fechaFinH = ult.getFechaEvento()+" "+ult.getHoraTopeEvento();
        	            	

        	            	System.out.println("Fecha de la primera ="+fechaIni+" "+prm.getClaveAsistencia());
        	            	System.out.println("Fecha de la ultima ="+fechaFin+" "+ult.getClaveAsistencia());
        	            	listaIndividual = asistencia_obj.listaAsistenciasIndividual(cn, prm.getFechaEvento(),ult.getFechaEvento(),nombreDia);

//        	            	System.out.println("Cantida de Asistencias programadas en el dia ("+fechaActual+") ="+asistencias.size());	                	
        		            if(listaIndividual.size()>0){
            	            	System.out.println("Cantida de Asistencias programadas ="+listaIndividual.size());	   
            	            	listaIndividual_All = asistencia_obj.listaAsistenciasIndividual_All(cn, prm.getFechaEvento(),ult.getFechaEvento(),nombreDia,listaIndividual);
        		    			
        		            }else {//LISTA INDIVIDUAL
//        		    			System.out.println("No hay personal en las Asistencias programadas  en el dia ("+fechaActual+")");	                	
        		            	logger.info("No hay personal en las Asistencias programadas en los dias "+fechaIniH+" - "+fechaFinH);
        		            }
                    		
        	            	
        	            }else {
        	            	logger.info("No hay Asistencias para leer");	                	
        	            	
        	            }
    	            	
    	            }else {
//    	    			System.out.println("No hay Asistencias programadas  en el dia ("+fechaActual+")");	                	
    	            	logger.info("No hay Asistencias para leer");           	
    	            }
    	            
            		
    	            
    	            
	            	

            		

	    			
					movimientoMarcaje movMar_obj = new movimientoMarcaje();
		            ArrayList<movimientoMarcaje> movimientosMarcajes = movMar_obj.listaMovMarcaje(cn, fechaIni,fechaFin,horaActual);
	            
		            if(movimientosMarcajes.size()==0 && asistencias.size()==0) {
			            if(movimientosMarcajes.size()>0){//
//			    			System.out.println("Cantida de Movimientos de marcaje en el dia ("+fechaActual+") ="+movimientosMarcajes.size());	                	
			            }else {
			            	logger.info("No hay Movimientos de marcajes ");
//			    			System.out.println("No hay Movimientos de marcaje en el dia ("+fechaActual+")");	                	
			            	
			            }
		            }else {
		    			/* INICIA RECORRER CADA DIA
		    			 *********************************************************************************** 
		    			 */
		            	ArrayList<String[]> tipoActividades = asistencia_obj.listaTipoActividad(cn);
		            	if(tipoActividades.size()==0) {
		                	String[] data = {
		                			"0","000",""
		                	};
		                	tipoActividades.add(data);
		            	}
		            	logger.info("Cantida de Asistencias programadas ="+asistencias.size());	                	
		            	logger.info("Cantida de Movimientos de marcaje ="+movimientosMarcajes.size());	                	
		            	logger.info("Cantida de PERSONAL asignados a las Asistencias programadas ="+listaIndividual.size());
			            
		            							int cantidadDias=0,contadorDias=0;
		    					    			
		    					    			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
		    							        Calendar cini = Calendar.getInstance();
		    							        try {
		    							            cini.setTime(formatter.parse(fechaIni));

		    							            Calendar cfin = Calendar.getInstance();
		    							            cfin.setTime(formatter.parse(fechaFin));
		    							            while (cfin.after(cini) || cfin.equals(cini)) {
		    							            	cantidadDias++;
		    							            	
		    							               	//FECHA CONSECUTIVA FORTAMRO SEGÚN SO => AAAA-MM-DD o AAAA/MM/DD
//		    							            	System.out.println(cantidadDias+".) "+formatter.format(cini.getTime()));
		    							            	String fechaEvento = formatter.format(cini.getTime());
		    							            	
		    							            	//LA VARIBLE array: DIVIDIR LA FECHA QUE SE ESTA RECORRIENDO , PERO EN FORMATO Calendar
		    							            	// EJEMPLO DE FORMATO => Sun Jun 09 00:00:00 VET 2019
		    							            	// POS 0 => NOMBRE DE DIA EN INGLES "Sun"
		    							            	// POS 1 => NOMBRE DE MES EN INGLES "Jun"
		    							            	// POS 2 => NUMERO DE DIA EN 09
		    							            	// POS 3 => HORA COMPLETA "00:00:00"
		    							            	// POS 4 => NO SE QUE ES "VET". SUPONGO QUE ES EL PAIS O ALGO ASI
		    							            	// POS 5 => AÑO COMPLETO 2019
		    							            	String[] array = cini.getTime().toString().split(" ");

	/*	    							            	System.out.println("Fecha: "+fechaEvento);
		    							            	System.out.println("Dia en INGLES: "+array[0]);
		    							            	System.out.println("Dia en ESPAÑOL: "+traducirDia(array[0])+"\n");
	*/
		    							            	String diaEvento =main.traducirDia(array[0]);
		    						        			String diaEvento_2 = diaEvento.substring(0, 2);
		    						    				resumen resumenes = new resumen();
		    						    				resumenes.setCnPostgre(cn);
		    							    			resumenes.leerListas(asistencias, movimientosMarcajes, listaIndividual, listaIndividual_All,dias,fechaEvento,diaEvento,tipoActividades);
		    							                cini.add(Calendar.DATE, 1);
		    							            
		    							            
		    							            }//DEL WHILE
		    							            
		    							            /*
		    							             * AQUI ACTUALIZO EL REGULADOR DE ASISTENCIAS LEIDAS POR CORRIDA
		    							             * */
		    							            
		    							        } 
		    							        catch (ParseException e2) {
		    							            e2.printStackTrace();
		    							            logger.info(":Error al recorrer las fechas de smn_plan_asistencia ID:");
		    							            logger.error(":"+e2);
		    					                	
		    							        }

//		    					System.out.println(cantidadDias);
		    			/*
		    			 *********************************************************************************** 
		    			 */				    			

		            }
  
            	
            	}else {
    				String m = "No encontro horarios en la tabla 'smn_gip.smn_horarios'";
    				logger.info(m);
            	}
	    	}// IF CONECTO A POSTGRE
			
		
        System.out.println("--FIN DE PROCESO: --\n");
    	logger.info("--FIN DE PROCESO: --\n");	   
		
		
	}
	public static int entero(String n) {
		int salida = -1;
		try {
			int aux = Integer.parseInt(n);
			salida = aux;
		} catch (Exception e) {
			logger.info("NO ES NUMERO :"+e); 
		}
		
		
		return salida;
		
	}
	public static String traducirDia(String diaIngles) {
		String diaEs = "";
			switch (diaIngles) {
			case "Mon":
				diaEs = "lunes";
				break;
			case "Tue":
				diaEs = "martes";
				break;
			case "Wed":
				diaEs = "miercoles";
				break;
			case "Thu":
				diaEs = "jueves";
				break;
			case "Fri":
				diaEs = "viernes";
				break;
			case "Sat":
				diaEs = "sabado";
				break;
			case "Sun":
				diaEs = "domingo";
				break;

			default:
				break;
			}
		
		return diaEs;
	}
	
	
	public static String clacularFechas(String fechaInicia) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
			String f = "0000-00-00";
	        Calendar cini = Calendar.getInstance();
	        try {
	            cini.setTime(formatter.parse(fechaInicia));

  //              System.out.println("Fecha Inicial: "+formatter.format(cini.getTime()));
	            
	            //el -1 es para Que tome la fecha de "AYER"
	            cini.add(Calendar.DATE, -1);
//                System.out.println(cini.getTime().toString());
//                System.out.println("Fecha del dia Anterior a '"+fechaInicia+"' :"+formatter.format(cini.getTime()));
                f = formatter.format(cini.getTime());
                
	        } 
	        catch (ParseException e2) {
	            logger.info("Error al calcular la fecha anterior de: "+fechaInicia);
	            e2.printStackTrace();
	        }
	        logger.info("Salida : "+f);
	        return f;
	}//
	
	public static String QueDiaSemana(int a,int m,int d){
		
		String nDia = "";
//		Calendar c = Calendar.getInstance();

//		c.set(a,m,d);
//		System.out.println("a.) "+c.getInstance());
//		System.out.println("b.) "+c.DAY_OF_WEEK);
//		System.out.println("c.) "+Calendar.DAY_OF_WEEK);

//		diaS = c.get(Calendar.DAY_OF_WEEK);
		String entrada = d+"-"+m+"-"+a;
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date dt1 = null;
		try {
			dt1 = format1.parse(entrada);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DateFormat format2 = new SimpleDateFormat("EEEE");
		String aaa = format2.format(dt1);
//		System.out.println(d+") "+aaa);

		String[] p = aaa.split("");
		nDia = p[0]+p[1];
//		System.out.println(nDia);
		
		if (aaa.equalsIgnoreCase("sábado")) {
			aaa="sabado";
		}
		return aaa;		
		
	}// FIN QueDiaSemana

}

/*
 * ALTER TABLE smn_control_acceso.smn_asistencia add column asi_hora_marcaje character(5);
	ALTER TABLE smn_control_acceso.smn_asistencia add column asi_estatus_marcaje character(2);

 * 
 * */
