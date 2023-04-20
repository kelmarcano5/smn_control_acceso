package ComparativoMarcaje;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import org.apache.log4j.Logger;


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
	public ArrayList<asistencia> listaAsistencias(Connection con,String diaAnterior){
        ArrayList<asistencia> asistencias = new ArrayList<asistencia>();
        try {
           	Statement sql=null;
      		ResultSet rs=null;
      		String sentencia ="Select * from smn_control_acceso.smn_asistencia " + 
			"INNER JOIN smn_control_acceso.smn_personal on smn_personal.smn_personal_id = smn_asistencia.asi_personal_rf " + 
			"where asi_fecha_evento='"+diaAnterior+"'";
      		
      		sentencia="Select * from smn_control_acceso.smn_asistencia " + 
      				"INNER JOIN smn_control_acceso.smn_personal on smn_personal.smn_personal_id = smn_asistencia.asi_personal_rf " + 
      				"INNER JOIN smn_control_acceso.smn_plan_asistencia on smn_plan_asistencia.smn_plan_asistencia_id = smn_asistencia.smn_plan_asistencia_id "+
      				"WHERE (asi_estatus_marcaje is null) and  smn_plan_asistencia.cpa_status = 'AP' " + 
      				"ORDER BY smn_asistencia.asi_fecha_evento ";
      		
			System.out.println(sentencia);
			
      		sql=con.createStatement();
            rs=sql.executeQuery(sentencia);
            while(rs.next()){
            	/*asistencia(int claveAsistencia,
            	 *  int clavePlanAsistencia,
            	 *  String claveControlAcceso, 
            	 *  int clavePersonal,
            	 *  String fechaEvento,
            	 *  String diaEvento,
            	 *  int turno, 
            	 *  int esquemaRotacion, 
            	 *  String tipoMarcaje,
            	 *  String horaTopeEvento, 
            	 *  String estatusPermiso, 
            	 *  String estatusProceso)*/
           	
            	asistencia obj = new asistencia(rs.getInt("smn_asistencia_id"),
            			rs.getInt("smn_plan_asistencia_id"),
            			rs.getString("asi_id_control_acceso"),
            			rs.getInt("asi_personal_rf"),
            			rs.getString("asi_fecha_evento"),
            			rs.getString("asi_dia_evento"),
            			rs.getInt("asi_turno_rf"),
            			rs.getInt("asi_esquema_rotacion_rf"),
            			rs.getString("asi_tipo_marcaje"),
            			rs.getString("asi_hora_tope_evento"),
            			rs.getString("asi_estatus_permiso_rf"),
            			rs.getString("asi_estatus_asistencia_rf")
            			);
            	asistencias.add(obj);
            	/*
            	 * 	public int claveAsistencia;//	smn_asistencias_id
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

            	 * */
            	
            	
            }
            
		
		} catch (Exception e) {
//    		logger.info("*** Lista de Horarios No disponible ***\n");
//    		logger.error("ERROR: "+e);
			logger.info("ERROR:(listaAsistencias): "+e);

		}
//        System.out.println(asistencias.get(0).getFechaEvento()+" "+asistencias.get(asistencias.size()-1).getFechaEvento());
		return asistencias;
	}
	
	
	
	public ArrayList<String[]> listaAsistenciasIndividual(Connection con,String dia_ini,String dia_fin,String nombreDia){
        ArrayList<String[]> personas = new ArrayList<String[]>();
        try {
           	Statement sql=null;
      		ResultSet rs=null;
      		String sentencia ="Select " + 
      				"			smn_asistencia.asi_personal_rf, " + 
      				"			smn_personal.psl_esquema_rotacion_rf, " + 
      				"			smn_personal.psl_estructura_organizacional_rf, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_detalle_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_lunes_id as lunes, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_martes_id as martes, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_miercoles_id as miercoles, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_jueves_id as jueves, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_viernes_id as viernes,  " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_sabado_id as sabado, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id as domingo, " + 
      				"			smn_base.smn_estructura_organizacional.eor_aprobador " + 
      				"			from smn_control_acceso.smn_asistencia " + 
      				"			INNER JOIN smn_control_acceso.smn_personal on smn_personal.smn_personal_id = smn_asistencia.asi_personal_rf " + 
      				"			inner join smn_gip.smn_esquema_rotacion_detalle on smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id = smn_personal.psl_esquema_rotacion_rf " + 
      				"			inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_personal.psl_estructura_organizacional_rf " + 
      				"			INNER JOIN smn_control_acceso.smn_plan_asistencia on smn_plan_asistencia.smn_plan_asistencia_id = smn_asistencia.smn_plan_asistencia_id " + 
      				"		      				" + 
      				"			where asi_fecha_evento between '"+dia_ini+"' and '"+dia_fin+"' and smn_plan_asistencia.cpa_status = 'AP' " + 
      				"			group by " + 
      				"			smn_asistencia.asi_personal_rf, " + 
      				"			smn_personal.psl_esquema_rotacion_rf, " + 
      				"			smn_personal.psl_estructura_organizacional_rf, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_detalle_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id , " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_lunes_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_martes_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_miercoles_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_jueves_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_viernes_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_sabado_id, " + 
      				"			smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id, " + 
      				"			smn_base.smn_estructura_organizacional.eor_aprobador;"; 
		System.out.println(sentencia);
			
      		sql=con.createStatement();
            rs=sql.executeQuery(sentencia);
            
           
            while(rs.next()){
                String jefe ="";
                if (rs.getString("eor_aprobador").equalsIgnoreCase(null) || rs.getString("eor_aprobador").equalsIgnoreCase("")) {
                	jefe = "0";
                }else {
                	jefe = rs.getString("eor_aprobador");
                	
                }

            	String[] data = {
            			rs.getString("asi_personal_rf"),
            			rs.getString("lunes"),
            			rs.getString("martes"),
            			rs.getString("miercoles"),
            			rs.getString("jueves"),
            			rs.getString("viernes"),
            			rs.getString("sabado"),
            			rs.getString("domingo"),
            			jefe
            			};
            	personas.add(data);
            }
            
		
		} catch (Exception e) {
//    		logger.info("*** Lista de Horarios No smn_asistencia ***\n");
//    		logger.error("ERROR: "+e);
			logger.info("ERROR listaAsistenciasIndividual:"+e);

		}
		return personas;
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
	
	public void clacularFechas(String fechaInicia,String fechaFinal) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
		        ArrayList<String> dates = new ArrayList<String>();
		        Calendar cini = Calendar.getInstance();
		        try {
		            cini.setTime(formatter.parse(fechaInicia));

		            Calendar cfin = Calendar.getInstance();
		            cfin.setTime(formatter.parse(fechaFinal));
		            while (cfin.after(cini) || cfin.equals(cini)) {
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
/*    			logger.info("No se ha podido MODIFICAR en  la tabla 'smn_control_acceso.smn_plan_asistencia'");
    			logger.error("Error: NO executeUpdate()");
*/            }
            
	  		
	  		
		} catch (SQLException e) {
/*			logger.info("Error al cambiar el 'cpa_status' a 'GE' en el plan: smn_control_acceso.smn_plan_asistencia="+idPlanAsistencia);
			logger.error("ERROR: "+e);*/
		}
		
		return salida;
	}

	public ArrayList<asistencia> desecharSuperiores(ArrayList<asistencia> asistencias,String fechaActual){
		ArrayList<asistencia> salida = new ArrayList<asistencia>();		
//        System.out.println("INI: "+asistencias.get(0).getFechaEvento()+" "+asistencias.get(asistencias.size()-1).getFechaEvento());

		
		for (int s = 0; s < asistencias.size(); s++) {
			asistencia el = asistencias.get(s);
			SimpleDateFormat dteFormat = new SimpleDateFormat("yyyy-MM-dd H:m:s");
			
			try {
					Date dAsi= dteFormat.parse(el.getFechaEvento()+" "+el.getHoraTopeEvento()+":00");
					Date dfechaActual = dteFormat.parse(fechaActual);
			
					int compare = dfechaActual.compareTo(dAsi);
					if(compare==0) {
						//MISO DIA HORA Y SEGUNOD
						//CASI IMPOSIBLE QUE SUCEDA- PERO POR SI LAS MOSCAS
						salida.add(el);

					}else if(compare==-1) {
						//FECHA ACTUAL ES MENOR A LA QUE SE DESEA COMPARAR
						
					}else if(compare == 1) {
						//FECHA ACTUAL ES MAYOR A LA QUE SE DESEA COMPARAR
						salida.add(el);
					}
					
					
					/*					
					System.out.println("");
					System.out.println("****");
					System.out.println(compare);
					System.out.println(fechaActual+" -> "+el.getFechaEvento()+" "+el.getHoraTopeEvento()+":00");
					System.out.println("****");
					*/
					
				} catch (ParseException e) {
				// TODO Auto-generated catch block
					logger.info(fechaActual+" -> "+el.getFechaEvento()+" "+el.getHoraTopeEvento()+":00");
					logger.info(e);
				}//CATCH
			
			
		}
//        System.out.println("FIN: "+salida.get(0).getFechaEvento()+" "+salida.get(salida.size()-1).getFechaEvento());

		
		
		return salida;
	}
	
	public ArrayList<asistencia> ordenarIdsGEnerales(ArrayList<asistencia> asistencias,String fechaActual){
		ArrayList<asistencia> salida = new ArrayList<asistencia>();		
		return salida;
	}
	
	public String PrimetUltimoId_GeneralesAsis(ArrayList<asistencia> asistencias){
		String salida = "0-0";
		int menor = asistencias.get(0).getClaveAsistencia();
		int mayor = asistencias.get(0).getClaveAsistencia();
		for (int i = 0; i < asistencias.size(); i++) {
			for (int j = 0; j < asistencias.size(); j++) {
				asistencia asij = asistencias.get(j);
				if(menor<asij.getClaveAsistencia()) {
					menor = asij.getClaveAsistencia();
				}
				if(mayor>asij.getClaveAsistencia()) {
					mayor = asij.getClaveAsistencia();
				}
				
			}
		}
		
		salida = menor+"-"+mayor;
		return salida;
	}

	
	public String horasMin_restantes(int dif) {
		String s = "";
		int diasDif = 0;
		int hrsDif = 0;
		int minDif = 0;
		if(dif>86400) {
			diasDif = (int) Math.floor(dif/86400);
			dif = dif-(diasDif*86400);
		}
		
		if (dif>3600) {
			hrsDif = (int)Math.floor(dif/3600);
			dif = dif-(hrsDif*3600);
		}

		if(dif>60) {
			minDif = (int)Math.floor(dif/60);
			dif = dif - (minDif*60);
		}
		

		String retrasoH = ""+hrsDif;
		if(hrsDif==0) {
			retrasoH="00";
		}
		
		if(hrsDif>0 && hrsDif<9){
			retrasoH="0"+hrsDif;
		}
		
		String retrasoM = ""+minDif;
		if(minDif==0) {
			retrasoM="00";
		}
		
		if(minDif>0 && minDif<9){
			retrasoM="0"+minDif;
		}
		
		s=retrasoH+":"+retrasoM;
		
		return s;
		
	}

	
	public ArrayList<String[]> listaAsistenciasIndividual_All(Connection con,String dia_ini,String dia_fin,String nombreDia,ArrayList<String[]> individulaListaPersonas){
        ArrayList<String[]> personas = new ArrayList<String[]>();
        String sqlIn = " IN (";
        for (int k = 0; k < individulaListaPersonas.size(); k++) {
        	String[] pAux = individulaListaPersonas.get(k);
        	if(k == individulaListaPersonas.size()-1) {
        		sqlIn += pAux[0]+")";
        	}else {
        		sqlIn += pAux[0]+",";
        		
        	}
        	

        }

        String fechaActual = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());     			
        
        try {
           	Statement sql=null;
      		ResultSet rs=null;

      			
      		String sentencia ="select * from smn_control_acceso.smn_asistencia " + 
			      				"where " + 
			      				"asi_personal_rf " +sqlIn+" and "+ 
			      				"asi_fecha_evento between '"+dia_ini+"' and '"+fechaActual+"'";
      		System.out.println(sentencia);
			
      		sql=con.createStatement();
            rs=sql.executeQuery(sentencia);
            
           
            while(rs.next()){

            	String[] data = {
            			rs.getString("smn_asistencia_id"),
            			rs.getString("asi_personal_rf"),
            			rs.getString("asi_fecha_evento"),
            			rs.getString("asi_tipo_marcaje"),
            			rs.getString("asi_hora_marcaje"),
            			rs.getString("asi_estatus_marcaje")
            			
            	};
//            	System.out.println(rs.getString("smn_asistencia_id")+"-"+rs.getString(17));
            	personas.add(data);
            }
            
		
		} catch (Exception e) {
//    		logger.info("*** Lista de Horarios No smn_asistencia ***\n");
//    		logger.error("ERROR: "+e);
			logger.info("ERROR listaAsistenciasIndividual_All :"+e);

		}
        return personas;
	}
	
	
}
