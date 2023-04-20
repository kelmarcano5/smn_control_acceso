package smn_proceso.generarAsistencia.src.generarAsistencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;

//import org.apache.log4j.Logger;


public class asistencia {
	public final static Logger logger = Logger.getLogger(asistencia.class);

	

	public int claveAsistencia;//	smn_asistencias_id
	public int clavePlanAsistencia;//	smn_plan_asistencia_id
	public String claveControlAcceso;//	asi_id_control_acceso
	public int clavePersonal;//	asi_personal_rf
	public String fechaEvento;//	asi_fecha evento
	public String diaEvento;//	asi_dia_evento
	public int turno;//	asi_turno_rf
	public int esquemaRotacion;//	asi_esquema _rotacion_rf
	public String tipoMarcaje;//	asi_tipo_marcaje
	public String horaTopeEvento;//	asi_hora_tope_evento
	public String estatusPermiso;//	asi_estatus_permiso_rf
	public String estatusProceso;//	asi_estatus_asistencia_ref

	public String error;
	public String errorOcurrido;

	public Connection cnPostgre;

	public asistencia(int claveAsistencia, int clavePlanAsistencia, String claveControlAcceso, int clavePersonal,
			String fechaEvento, String diaEvento, int turno, int esquemaRotacion, String tipoMarcaje,
			String horaTopeEvento, String estatusPermiso, String estatusProceso) {
		super();
		this.claveAsistencia = claveAsistencia;
		this.clavePlanAsistencia = clavePlanAsistencia;
		this.claveControlAcceso = claveControlAcceso;
		this.clavePersonal = clavePersonal;
		this.fechaEvento = fechaEvento;
		this.diaEvento = diaEvento;
		this.turno = turno;
		this.esquemaRotacion = esquemaRotacion;
		this.tipoMarcaje = tipoMarcaje;
		this.horaTopeEvento = horaTopeEvento;
		this.estatusPermiso = estatusPermiso;
		this.estatusProceso = estatusProceso;
	}

	public asistencia() {
		super();
	}

	public int getClaveAsistencia() {
		return claveAsistencia;
	}

	public void setClaveAsistencia(int claveAsistencia) {
		this.claveAsistencia = claveAsistencia;
	}

	public int getClavePlanAsistencia() {
		return clavePlanAsistencia;
	}

	public void setClavePlanAsistencia(int clavePlanAsistencia) {
		this.clavePlanAsistencia = clavePlanAsistencia;
	}

	public String getClaveControlAcceso() {
		return claveControlAcceso;
	}

	public void setClaveControlAcceso(String claveControlAcceso) {
		this.claveControlAcceso = claveControlAcceso;
	}

	public int getClavePersonal() {
		return clavePersonal;
	}

	public void setClavePersonal(int clavePersonal) {
		this.clavePersonal = clavePersonal;
	}

	public String getFechaEvento() {
		return fechaEvento;
	}

	public void setFechaEvento(String fechaEvento) {
		this.fechaEvento = fechaEvento;
	}

	public String getDiaEvento() {
		return diaEvento;
	}

	public void setDiaEvento(String diaEvento) {
		this.diaEvento = diaEvento;
	}

	public int getTurno() {
		return turno;
	}

	public void setTurno(int turno) {
		this.turno = turno;
	}

	public int getEsquemaRotacion() {
		return esquemaRotacion;
	}

	public void setEsquemaRotacion(int esquemaRotacion) {
		this.esquemaRotacion = esquemaRotacion;
	}

	public String getTipoMarcaje() {
		return tipoMarcaje;
	}

	public void setTipoMarcaje(String tipoMarcaje) {
		this.tipoMarcaje = tipoMarcaje;
	}

	public String getHoraTopeEvento() {
		return horaTopeEvento;
	}

	public void setHoraTopeEvento(String horaTopeEvento) {
		this.horaTopeEvento = horaTopeEvento;
	}

	public String getEstatusPermiso() {
		return estatusPermiso;
	}

	public void setEstatusPermiso(String estatusPermiso) {
		this.estatusPermiso = estatusPermiso;
	}

	public String getEstatusProceso() {
		return estatusProceso;
	}

	public void setEstatusProceso(String estatusProceso) {
		this.estatusProceso = estatusProceso;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	} 

//////////////////////////////////////////////
	public String getErrorOcurrido() {
		return errorOcurrido;
	}

	public void setErrorOcurrido(String errorOcurrido) {
		this.errorOcurrido = errorOcurrido;
	}

	public Connection getCnPostgre() {
		return cnPostgre;
	}
	public void setCnPostgre(Connection cnPostgre) {
		this.cnPostgre = cnPostgre;
	}

///////////////////////////////////////////////////
	public void generarAsitencia(String idPlanAsistencia,int esquemaId, int estructuraId,ArrayList<horarios> dias,String fechDesde,String fechHasta) throws SQLException {
		
		try {
				Statement sql=null;
		  		ResultSet rs=null;
                String sentenciaPersonalS="select smn_control_acceso.smn_personal.smn_personal_id,smn_control_acceso.smn_personal.psl_id_control_acceso," + 
                		"smn_control_acceso.smn_personal.psl_esquema_rotacion_rf, " + 
                		"smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id, " + 
                		"smn_base.smn_entidades.smn_entidades_id, " + 
                		"smn_base.smn_sucursales.smn_sucursales_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_detalle_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_lunes_id as lunes ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_martes_id as martes ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_miercoles_id as miercoles ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_jueves_id as jueves ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_viernes_id as viernes ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_sabado_id as sabado ," + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id as domingo ," + 
                		"smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf as asi_estatus_permiso_rf " + 
                		"from smn_control_acceso.smn_personal " + 
                		"inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf " + 
                		"inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf " + 
                		"inner join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf " + 
                		"inner join smn_gip.smn_esquema_rotacion_detalle on smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id = smn_control_acceso.smn_personal.psl_esquema_rotacion_rf " + 
                		"left outer join smn_control_acceso.smn_solicitud_permisos on smn_control_acceso.smn_solicitud_permisos.smn_personal_id = smn_control_acceso.smn_personal.smn_personal_id " + 
                		
                		"where smn_control_acceso.smn_personal.psl_estructura_organizacional_rf="+estructuraId+" and smn_control_acceso.smn_personal.psl_esquema_rotacion_rf="+esquemaId+" "+ 

                		"group by smn_control_acceso.smn_personal.smn_personal_id,smn_control_acceso.smn_personal.psl_id_control_acceso, " + 
                		"smn_control_acceso.smn_personal.psl_esquema_rotacion_rf, " + 
                		"smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id, " + 
                		"smn_base.smn_entidades.smn_entidades_id, " + 
                		"smn_base.smn_sucursales.smn_sucursales_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_detalle_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_lunes_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_martes_id , " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_miercoles_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_jueves_id , " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_viernes_id, " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_sabado_id , " + 
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id, " + 
                		"smn_control_acceso.smn_solicitud_permisos.spe_estatus_rf";
//                System.out.println(sentenciaPersonalS);
                sql=this.getCnPostgre().createStatement();
                rs=sql.executeQuery(sentenciaPersonalS);
                int cantidadDias=0;
                int cantidadPersonal=0;
      			int contadorDias=0;
//      			System.out.println(sentenciaPersonalS);
      			
      			int contadorPersonal=0;

      			while(rs.next()){

      				cantidadPersonal++;
        			String permisoL = "";

	        		if(rs.getString("asi_estatus_permiso_rf")==null) {
	        			permisoL = "N";
	        		}else {
		        		permisoL = rs.getString("asi_estatus_permiso_rf").substring(0, 1);
        			
	        		}

	    			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
			        ArrayList<String> dates = new ArrayList<String>();
			        Calendar cini = Calendar.getInstance();
			        try {
			            cini.setTime(formatter.parse(fechDesde));

			            Calendar cfin = Calendar.getInstance();
			            cfin.setTime(formatter.parse(fechHasta));
			            while (cfin.after(cini) || cfin.equals(cini)) {
			            	cantidadDias++;
		                    dates.add(formatter.format(cini.getTime()));
		                    String[] array = cini.getTime().toString().split(" ");
		                    String[] arrayData = cini.getTime().toLocaleString().split(" ");
		                    String fechaACalcular = arrayData[0];
		                    String[] fechaACalcular_partes = fechaACalcular.split("/");
		                    String fechaEvento = fechaACalcular_partes[0]+"-"+fechaACalcular_partes[1]+"-"+fechaACalcular_partes[2];
		                    
		        			String diaEvento =this.traducirDia(array[0]);
		        			String diaEvento_2 = diaEvento.substring(0, 2);

		        			horarios horasAus = new horarios();
		        			
		        			horarios HorarioDia_N = horasAus.buscarHorario(dias,rs.getInt(diaEvento));
		        			String sentenciasDia_N = this.GenerarSentencia(HorarioDia_N,diaEvento,idPlanAsistencia,rs.getString("psl_id_control_acceso"),rs.getString("smn_personal_id"),fechaEvento,diaEvento_2,permisoL,estructuraId,esquemaId);
			        		int n = this.getCnPostgre().createStatement().executeUpdate(sentenciasDia_N);
							if (n > 0) {
								contadorDias++;
			                }else {
								String m = "_ No se ha podido Insertar las asistencias del Día "+diaEvento+" en la tabla 'smn_control_acceso.smn_asistencia'\t Error: NO executeUpdate()";
			                	logger.error(m);	                	
			                }
			                cini.add(Calendar.DATE, 1);
			            }//DEL WHILE

			            //ESTO QUIERE DECIR QUE EN CASO DE QUE AL MENOS UNO DE LOS "DIAS" CORRESPONDIENTE AL PERSONAL ------> OSEA LAS ASISTENCIAS
			            //OBTENIDO DEL PLAN_ASISTENCIA
			            // NO SE INSERTO CORRECTAMENTE
			            if((cantidadDias-contadorDias)!=0) {
		                	logger.error("No se inserto completamente las asistencias en smn_plan_asistencia ID:("+idPlanAsistencia+") al personal con el ID ("+rs.getString("smn_personal_id")+")");
		                	logger.info("Cantidad DIAS del plan: "+cantidadDias);
		                	logger.info("Cantidad DIAS del plan NO insertados: "+(cantidadDias-contadorDias));
		                	
			            }else { // SI SE EJECUTARON TODOS LOS "INSERT" (OSEA LAS ASISTENCIAS) DEL PERSONAL CORRECTAMENTE
			            	contadorPersonal++;
			            	
			            }
			            
			        } 
			        catch (ParseException e2) {
			            e2.printStackTrace();
	                	logger.info("Error al recorrer las fechas de smn_plan_asistencia ID:("+idPlanAsistencia+")");
	                	logger.error(e2);
	                	
			        }
      			}//DEL WHILE
            	logger.info("Cantidad de personal en este smn_plan_asistencia ID:("+idPlanAsistencia+"): "+(cantidadPersonal));	                	
      			logger.info("Cantidad de asistencias Generadas: "+(contadorDias)+" *4 = "+(contadorDias*4));	                	


      			/*
      			 * CAMBIO DE ESTATUS DE APROBADO "AP" A GENERADO "GE"
      			 * POR CADA PLAN RECORRIDO
      			 *
      			 */
      			this.cambiarEstatusPlan(idPlanAsistencia);
      			
      			
		}catch (Exception e) {
			logger.info("Error al generar las asistenca del smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id="+idPlanAsistencia);
			logger.error("ERROR: "+e);
		}
		
	}
	
	public String traducirDia(String diaIngles) {
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
	public String GenerarSentencia(horarios dia, String nombreDia,String planAsistencia,String psl_id_control_acceso,String smn_personal_id,String fechEvento, String diaEvento,String asi_estatus_permiso_rf,int estructuraOrgId,int idEsqema){
        String horaActual = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
        String fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			
        
        
		String sentenciaL="INSERT INTO smn_control_acceso.smn_asistencia("
	            +" smn_asistencia_id,"
	            + " smn_plan_asistencia_id,"
	            + " asi_id_control_acceso, "
	           
	            +" asi_personal_rf, "
	            + "asi_fecha_evento, "
	            + "asi_dia_evento, "
	            + "asi_turno_rf, "
	            
	            +" asi_esquema_rotacion_rf,"
	            + " asi_tipo_marcaje,"
	            + " asi_hora_tope_evento, "
	            
	            +" asi_estatus_permiso_rf,"
	            + " asi_estatus_asistencia_rf,"
	            
	            + " asi_idioma, "
	            +" asi_usuario, asi_fecha_registro, asi_hora) "
	    +" VALUES ("
	    		 
	    		 +"nextval('smn_control_acceso.seq_smn_asistencia'),"
	             +planAsistencia+"  ,"
	             +"'"+psl_id_control_acceso+"',"

	             +smn_personal_id+"  ,"
	             +"'"+fechEvento+"' ,"
	             +"'"+diaEvento+"' ,"
	             +dia.getSmn_turnos_id()+"  ,"
	             
	             +idEsqema+"  ,"
	             +"'ENT',"
	             +"'"+dia.getHor_hora_inicio()+"',"

	             +" '"+asi_estatus_permiso_rf+"',"
	             +"'GEN',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"'"
				+ ");";		

		if(dia.getHor_descanso_inicio()==null) {
			dia.setHor_descanso_inicio("12:00");
		}

		if(dia.getHor_descanso_final()==null) {
			dia.setHor_descanso_final("13:30");
		}

		sentenciaL+=""
				+ "INSERT INTO smn_control_acceso.smn_asistencia("
	            +" smn_asistencia_id,"
	            + " smn_plan_asistencia_id,"
	            + " asi_id_control_acceso, "
	           
	            +" asi_personal_rf, "
	            + "asi_fecha_evento, "
	            + "asi_dia_evento, "
	            + "asi_turno_rf, "
	            
	            +" asi_esquema_rotacion_rf,"
	            + " asi_tipo_marcaje,"
	            + " asi_hora_tope_evento, "
	            
	            +" asi_estatus_permiso_rf,"
	            + " asi_estatus_asistencia_rf,"
	            
	            + " asi_idioma, "
	            +" asi_usuario, asi_fecha_registro, asi_hora) "
	    +" VALUES ("
	    		 
	    		 +"nextval('smn_control_acceso.seq_smn_asistencia'),"
	             +planAsistencia+"  ,"
	             +"'"+psl_id_control_acceso+"',"

	             +smn_personal_id+"  ,"
	             +"'"+fechEvento+"' ,"
	             +"'"+diaEvento+"' ,"
	             +dia.getSmn_turnos_id()+"  ,"
	             
	             +idEsqema+"  ,"
	             +"'SAL',"
	             +"'"+dia.getHor_hora_final()+"',"

	             +" '"+asi_estatus_permiso_rf+"',"
	             +"'GEN',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"'"
				+ ");";		

		sentenciaL+="INSERT INTO smn_control_acceso.smn_asistencia("
	            +" smn_asistencia_id,"
	            + " smn_plan_asistencia_id,"
	            + " asi_id_control_acceso, "
	           
	            +" asi_personal_rf, "
	            + "asi_fecha_evento, "
	            + "asi_dia_evento, "
	            + "asi_turno_rf, "
	            
	            +" asi_esquema_rotacion_rf,"
	            + " asi_tipo_marcaje,"
	            + " asi_hora_tope_evento, "
	            
	            +" asi_estatus_permiso_rf,"
	            + " asi_estatus_asistencia_rf,"
	            
	            + " asi_idioma, "
	            +" asi_usuario, asi_fecha_registro, asi_hora) "
	    +" VALUES ("
	    		 
	    		 +"nextval('smn_control_acceso.seq_smn_asistencia'),"
	             +planAsistencia+"  ,"
	             +"'"+psl_id_control_acceso+"',"

	             +smn_personal_id+"  ,"
	             +"'"+fechEvento+"' ,"
	             +"'"+diaEvento+"' ,"
	             +dia.getSmn_turnos_id()+"  ,"
	             
	             +idEsqema+"  ,"
	             +"'ENT',"
	             +"'"+dia.getHor_descanso_inicio()+"',"

	             +" '"+asi_estatus_permiso_rf+"',"
	             +"'GEN',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"'"
				+ ");";		

		
		sentenciaL+=""
				+ "INSERT INTO smn_control_acceso.smn_asistencia("
	            +" smn_asistencia_id,"
	            + " smn_plan_asistencia_id,"
	            + " asi_id_control_acceso, "
	           
	            +" asi_personal_rf, "
	            + "asi_fecha_evento, "
	            + "asi_dia_evento, "
	            + "asi_turno_rf, "
	            
	            +" asi_esquema_rotacion_rf,"
	            + " asi_tipo_marcaje,"
	            + " asi_hora_tope_evento, "
	            
	            +" asi_estatus_permiso_rf,"
	            + " asi_estatus_asistencia_rf,"
	            
	            + " asi_idioma, "
	            +" asi_usuario, asi_fecha_registro, asi_hora) "
	    +" VALUES ("
	    		 
	    		 +"nextval('smn_control_acceso.seq_smn_asistencia'),"
	             +planAsistencia+"  ,"
	             +"'"+psl_id_control_acceso+"',"

	             +smn_personal_id+"  ,"
	             +"'"+fechEvento+"' ,"
	             +"'"+diaEvento+"' ,"
	             +dia.getSmn_turnos_id()+"  ,"
	             
	             +idEsqema+"  ,"
	             +"'SAL',"
	             +"'"+dia.getHor_descanso_final()+"',"

	             +" '"+asi_estatus_permiso_rf+"',"
	             +"'GEN',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"'"
				+ ");";		

		
		
		return sentenciaL;
	}
	
	public void clacularFechas(String fechaInicia,String fechaFinal) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
		        ArrayList<String> dates = new ArrayList<String>();
		        Calendar cini = Calendar.getInstance();
		        try {
		            cini.setTime(formatter.parse(fechaInicia));

		            Calendar cfin = Calendar.getInstance();
		            cfin.setTime(formatter.parse(fechaFinal));
		            while (cfin.after(cini) || cfin.equals(cini)) {
	                    logger.info("---------->" + cini.getTime().toString());
	                    dates.add(formatter.format(cini.getTime()));
		                cini.add(Calendar.DATE, 1);
		            }
		            for(String c1 : dates){
		                System.out.println("Fecha: " + c1);
		            }
		        } 
		        catch (ParseException e2) {
		            e2.printStackTrace();
		        }
	}
	
	public Hashtable<String, String> buscarHorario(ArrayList<Hashtable> dias,String id){
		Hashtable<String, String> horario = new Hashtable<>();

		for (int j = 0; j < dias.size(); j++) {
			Hashtable<String, String> el = dias.get(j);
			if(el.get("smn_horarios_id").equals(id)) {
				horario = el;
				break;
			}
		}
		
		return horario;
	}
	
	public boolean cambiarEstatusPlan(String idPlanAsistencia) throws SQLException {
		boolean salida =false;
		try {
			Statement sql=null;
	  		String sentenciaCambio ="UPDATE smn_control_acceso.smn_plan_asistencia" + 
	  				"   SET cpa_status='GE'"+ 
	  				" WHERE smn_plan_asistencia_id="+idPlanAsistencia+";";
	  		sql=this.getCnPostgre().createStatement();
            int rs=sql.executeUpdate(sentenciaCambio );

            if(rs>0) {
            	salida =true;
            }else {
    			logger.info("No se ha podido MODIFICAR en  la tabla 'smn_control_acceso.smn_plan_asistencia'");
    			logger.error("Error: NO executeUpdate()");
            }
            
	  		
	  		
		} catch (SQLException e) {
			logger.info("Error al cambiar el 'cpa_status' a 'GE' en el plan: smn_control_acceso.smn_plan_asistencia="+idPlanAsistencia);
			logger.error("ERROR: "+e);
		}
		
		return salida;
	}
}
