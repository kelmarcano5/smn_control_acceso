package procesos;

import java.io.FileWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;

import dinamica.Db;
import dinamica.Recordset;


public class asistencia {

	

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

	public FileWriter fw;
	public Db db;
	
	public String error;
	public String errorOcurrido;

	public Connection cnPostgre;

	public asistencia(FileWriter f) {
		this.fw = f;
	}
	
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

	
	
	public FileWriter getFw() {
		return fw;
	}

	public void setFw(FileWriter fw) {
		this.fw = fw;
	}

	public Db getDb() {
		return db;
	}

	public void setDb(Db db) {
		this.db = db;
	}

	///////////////////////////////////////////////////
	public void generarAsitencia(String idPlanAsistencia,int esquemaId, int estructuraId,ArrayList<horarios> dias,String fechDesde,String fechHasta) throws Throwable {
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		try {
			//VT se añade una verificacion de registros en la relacion del plan con personal.
			//Para utilizar un select con el personal seleccionado o utilizar un select con el personal de
			//todas las estructuras seleccionadas.
			String sentenciaPersonalS="";
				String sentenciaPlanPersonal="select count(smn_personal_id) as cantidad " +
						"from smn_control_acceso.smn_plan_asistencia_personal " +
						"where smn_plan_asistencia_id="+idPlanAsistencia;
				Recordset rs9 = this.getDb().get(sentenciaPlanPersonal);	
				int cantidadPlanPersonal=0;
				while(rs9.next()){
					cantidadPlanPersonal=rs9.getInteger("cantidad");
					if(cantidadPlanPersonal > 0){
						
					
						sentenciaPersonalS="select smn_control_acceso.smn_personal.smn_personal_id,smn_control_acceso.smn_personal.psl_id_control_acceso," + 
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
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id as domingo " + 
                		"from smn_control_acceso.smn_plan_asistencia_personal " + 
                		"inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.smn_personal_id=smn_control_acceso.smn_plan_asistencia_personal.smn_personal_id " +
                		"inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf " + 
                		"inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf " + 
                		"inner join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf " + 
                		"inner join smn_gip.smn_esquema_rotacion_detalle on smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id = smn_control_acceso.smn_personal.psl_esquema_rotacion_rf " + 
                		"where smn_control_acceso.smn_plan_asistencia_personal.smn_plan_asistencia_id="+idPlanAsistencia+
//                		"where smn_control_acceso.smn_personal.psl_estructura_organizacional_rf="+estructuraId+
//                		" and smn_control_acceso.smn_personal.psl_esquema_rotacion_rf="+esquemaId+" "+ 

                		" group by smn_control_acceso.smn_personal.smn_personal_id,smn_control_acceso.smn_personal.psl_id_control_acceso, " + 
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
                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id ";
					}else{
							sentenciaPersonalS="select smn_control_acceso.smn_personal.smn_personal_id,smn_control_acceso.smn_personal.psl_id_control_acceso," + 
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
		                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id as domingo " + 
		                		"from smn_control_acceso.smn_plan_asistencia " + 
		                		"inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_estructura_organizacional_rf=smn_control_acceso.smn_plan_asistencia.smn_estructura_organizacional_rf " +
		                		"inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_control_acceso.smn_personal.psl_empresa_rf " + 
		                		"inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_control_acceso.smn_personal.psl_estructura_organizacional_rf " + 
		                		"inner join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_control_acceso.smn_personal.psl_sucursal_rf " + 
		                		"inner join smn_gip.smn_esquema_rotacion_detalle on smn_gip.smn_esquema_rotacion_detalle.smn_esquema_rotacion_id = smn_control_acceso.smn_personal.psl_esquema_rotacion_rf " + 
		                		"where smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id="+idPlanAsistencia+
		                		" and smn_control_acceso.smn_personal.psl_estructura_organizacional_rf="+estructuraId+
		                		" and smn_control_acceso.smn_personal.psl_esquema_rotacion_rf="+esquemaId+" "+ 

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
		                		"smn_gip.smn_esquema_rotacion_detalle.smn_horarios_domingo_id ";
						
						
					}
				}
                
//                System.out.println(sentenciaPersonalS);
                Recordset rs = this.getDb().get(sentenciaPersonalS);
                int cantidadDias=0;
                int cantidadPersonal=0;
      			int contadorDias=0;
//      			System.out.println(sentenciaPersonalS);

      			int contadorPersonal=0;

      			boolean existenPermisos= false;
      			ArrayList<String[]> listaPermisos = this.buscarPermisos(fechDesde, fechHasta);
      			if(listaPermisos.size()>0) {
      				existenPermisos = true;
      			}
      			
      			while(rs.next()){
      				cantidadPersonal++;
        			String permisoL = "";

	    			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
			        Calendar cini = Calendar.getInstance();
			        try {
			            cini.setTime(formatter.parse(fechDesde));

			            Calendar cfin = Calendar.getInstance();
			            cfin.setTime(formatter.parse(fechHasta));
			            while (cfin.after(cini) || cfin.equals(cini)) {
			            	cantidadDias++;
			            	
			               	//FECHA CONSECUTIVA FORTAMRO SEGÚN SO => AAAA-MM-DD o AAAA/MM/DD
//			            	System.out.println(1+".) "+formatter.format(cini.getTime()));
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
/*
 			            	System.out.println("Fecha: "+fechaEvento);
			            	System.out.println("Dia en INGLES: "+array[0]);
			            	System.out.println("Dia en ESPAÑOL: "+traducirDia(array[0]));
*/

			            	String diaEvento =this.traducirDia(array[0]);
		        			String diaEvento_2 = diaEvento.substring(0, 2);

		        			
		        			
		        			
			        		if(existenPermisos) {
			        			permisoL = this.buscarEnPermisos(rs.getString("smn_personal_id"), fechaEvento, listaPermisos);
			        			if(permisoL=="") {
				        			permisoL = "N";
			        			}
			        		}else {
			        			permisoL = "N";

			        		}

//		        			System.out.println(existenPermisos+" -- "+permisoL);
		        			
		        			
		        			horarios horasAus = new horarios();
		        			horarios HorarioDia_N = horasAus.buscarHorario(dias,rs.getInt(diaEvento));
		        			String sentenciasDia_N = this.GenerarSentencia(HorarioDia_N,diaEvento,idPlanAsistencia,rs.getString("psl_id_control_acceso"),rs.getString("smn_personal_id"),fechaEvento,diaEvento_2,permisoL,estructuraId,esquemaId);
		        			if(HorarioDia_N.getSmn_horarios_id()>1) {
			        			try{
									contadorDias++;
			        				int rs2 = this.getDb().exec(sentenciasDia_N);
			        				
			        			}catch(ParseException e2){
			        				System.out.println(e2+"LINEA 308");

			        			}
		        				
		        			}else if(HorarioDia_N.getSmn_horarios_id()==1) {
		        				//DIA LIBRE//
		        				contadorDias++;

		        			}
			        		
			        		/*							if (n > 0) {
			                }else {
								String m = "_ No se ha podido Insertar las asistencias del Día "+diaEvento+" en la tabla 'smn_control_acceso.smn_asistencia'\t Error: NO executeUpdate()";
								System.out.println(timestamp+":"+m);	                	
			                }*/
			                cini.add(Calendar.DATE, 1);
			            }//DEL WHILE

			            //ESTO QUIERE DECIR QUE EN CASO DE QUE AL MENOS UNO DE LOS "DIAS" CORRESPONDIENTE AL PERSONAL ------> OSEA LAS ASISTENCIAS
			            //OBTENIDO DEL PLAN_ASISTENCIA
			            // NO SE INSERTO CORRECTAMENTE
			            if((cantidadDias-contadorDias)!=0) {
			            	System.out.println(timestamp+":No se inserto completamente las asistencias en smn_plan_asistencia ID:("+idPlanAsistencia+") al personal con el ID ("+rs.getString("smn_personal_id")+")");
			            	System.out.println(timestamp+":Cantidad DIAS del plan: "+cantidadDias);
			            	System.out.println(timestamp+":Cantidad DIAS del plan NO insertados: "+(cantidadDias-contadorDias));
		                	
			            }else { // SI SE EJECUTARON TODOS LOS "INSERT" (OSEA LAS ASISTENCIAS) DEL PERSONAL CORRECTAMENTE
			            	contadorPersonal++;
			            	
			            }
			            
			        } 
			        catch (ParseException e2) {
			            e2.printStackTrace();
			            System.out.println(timestamp+":Error al recorrer las fechas de smn_plan_asistencia ID:("+idPlanAsistencia+")");
			            System.out.println(timestamp+":"+e2);
	                	
			        }
      			}//DEL WHILE
      			System.out.println(timestamp+":Cantidad de personal en este smn_plan_asistencia ID:("+idPlanAsistencia+"): "+(cantidadPersonal));	                	
      			System.out.println(timestamp+":Cantidad de asistencias Generadas: "+(contadorDias)+" *5 = "+(contadorDias*5));


      			/*
      			 * CAMBIO DE ESTATUS DE APROBADO "AP" A GENERADO "GE"
      			 * POR CADA PLAN RECORRIDO
      			 *
      			 */
      			this.cambiarEstatusPlan(idPlanAsistencia);
      			
      			
		}catch (Exception e) {
			System.out.println(timestamp+":Error al generar las asistenca del smn_control_acceso.smn_plan_asistencia.smn_plan_asistencia_id="+idPlanAsistencia);
			System.out.println(timestamp+":ERROR: "+e);
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
        
        int secuencia=1;
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
	            +" asi_usuario, asi_fecha_registro, asi_hora,"
	            + " asi_secuencia_tipo_marcaje) "
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
	             +"'GE',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"',"
				+secuencia
				+ ");";		

		if(dia.getHor_descanso_inicio()==null) {
			dia.setHor_descanso_inicio("12:00");
		}

		if(dia.getHor_descanso_final()==null) {
			dia.setHor_descanso_final("13:30");
		}
		secuencia=4;
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
	            +" asi_usuario, asi_fecha_registro, asi_hora,"
	            + " asi_secuencia_tipo_marcaje) "
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
	             +"'GE',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"',"
				+secuencia
				+ ");";		

		
		
		// HORA DE DESCANSO-> CAMBIADO A SALIDA
		secuencia=2;  
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
	            +" asi_usuario, asi_fecha_registro, asi_hora,"
	            + " asi_secuencia_tipo_marcaje) "
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
	             +"'"+dia.getHor_descanso_inicio()+"',"

	             +" '"+asi_estatus_permiso_rf+"',"
	             +"'GE',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"',"
				+secuencia
				+ ");";		


		// HORA DE DESCANSO-> CAMBIADO A SALIDA
		secuencia=3;
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
	            +" asi_usuario, asi_fecha_registro, asi_hora,"
	            + " asi_secuencia_tipo_marcaje) "
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
	             +"'"+dia.getHor_descanso_final()+"',"

	             +" '"+asi_estatus_permiso_rf+"',"
	             +"'GE',"
	             + "'es',"
	             + "'admin',"
				+ "'"+fechaActual+"',"
				+ "'"+horaActual+"',"
				+secuencia
				+ ");";		

		/*****************
		 * 
		 * INICIA ASISTENCIAS EN COMEDOR
		 * COMEDOR
		 * VT: Se cambia a generar el registro a la tabla smn_asistencia_comedor
		 * *******************/

//		sentenciaL+=""
//				+ "INSERT INTO smn_control_acceso.smn_asistencia("
//	            +" smn_asistencia_id,"
//	            + " smn_plan_asistencia_id,"
//	            + " asi_id_control_acceso, "
//	           
//	            +" asi_personal_rf, "
//	            + "asi_fecha_evento, "
//	            + "asi_dia_evento, "
//	            + "asi_turno_rf, "
//	            
//	            +" asi_esquema_rotacion_rf,"
//	            + " asi_tipo_marcaje,"
//	            + " asi_hora_tope_evento, "
//	            
//	            +" asi_estatus_permiso_rf,"
//	            + " asi_estatus_asistencia_rf,"
//	            
//	            + " asi_idioma, "
//	            +" asi_usuario, asi_fecha_registro, asi_hora) "
//	    +" VALUES ("
//	    		 
//	    		 +"nextval('smn_control_acceso.seq_smn_asistencia'),"
//	             +planAsistencia+"  ,"
//	             +"'"+psl_id_control_acceso+"',"
//
//	             +smn_personal_id+"  ,"
//	             +"'"+fechEvento+"' ,"
//	             +"'"+diaEvento+"' ,"
//	             +dia.getSmn_turnos_id()+"  ,"
//	             
//	             +idEsqema+"  ,"
//	             +"'CO',"
//	             +"'"+dia.getHor_descanso_inicio()+"',"
//
//	             +" '"+asi_estatus_permiso_rf+"',"
//	             +"'GE',"
//	             + "'es',"
//	             + "'admin',"
//				+ "'"+fechaActual+"',"
//				+ "'"+horaActual+"'"
//				+ ");";		
		if(asi_estatus_permiso_rf.equalsIgnoreCase("N")){
		sentenciaL+=""
				+ "INSERT INTO smn_control_acceso.smn_asistencia_comedor("
				+" smn_asistencia_comedor_id,"
				+" smn_personal_id," 
				+" com_fecha_generada," 
				+" com_hora_generada," 
				+" com_estatus," 
				+" com_idioma," 
				+" com_usuario," 
				+" com_fecha_registro," 
				+" com_hora)" 
				
		+" VALUES ("
				+"nextval('smn_control_acceso.seq_smn_asistencia_comedor'),"
				+smn_personal_id+"  ,"
				+"'"+fechEvento+"' ,"
				+"'"+dia.getHor_descanso_inicio()+"',"
				+"'GE',"
 	            + "'es',"
 	            + "'admin',"
 				+ "'"+fechaActual+"',"
 				+ "'"+horaActual+"'"
				+ ");";	
		}
		/**************************************************************/
		
		
		return sentenciaL;
	}
	
/*	public void clacularFechas(String fechaInicia,String fechaFinal) {
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
	}*/
	
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
	
	public boolean cambiarEstatusPlan(String idPlanAsistencia) throws Throwable {
		boolean salida =false;
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		try {
	  		String sentenciaCambio ="UPDATE smn_control_acceso.smn_plan_asistencia" + 
	  				"   SET cpa_status='GE'"+ 
	  				" WHERE smn_plan_asistencia_id="+idPlanAsistencia+";";
            int rs = this.getDb().exec(sentenciaCambio);
	  		
		} catch (SQLException e) {
			System.out.println(timestamp+":Error al cambiar el 'cpa_status' a 'GE' en el plan: smn_control_acceso.smn_plan_asistencia="+idPlanAsistencia);
			System.out.println(timestamp+":ERROR: "+e);
		}
		
		return salida;
	}

	public ArrayList<String[]> buscarPermisos(String desde,String hasta) throws Throwable {
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		 ArrayList<String[]> salida = new ArrayList<String[]>();
		try {
	  		String sentenciaSolicitudes ="select * from smn_control_acceso.smn_solicitud_permisos " + 
//	  				"where spe_fecha_desde between'"+desde+"' and '"+hasta+"';";
//	  				"where spe_fecha_desde>='2018-05-15' and spe_fecha_hasta<='2018-06-15';";
//				"	spe_fecha_desde <= to_date('2019-09-01','YYYY-MM-DD')" + 
//				"	and " + 
//				"	spe_fecha_hasta >= to_date('2019-08-26','YYYY-MM-DD')" + 

				"	where spe_fecha_desde <= to_date('"+hasta+"','YYYY-MM-DD')" + 
				"	and " + 
				"	spe_fecha_hasta >= to_date('"+desde+"','YYYY-MM-DD')" + 
				"";
			Recordset rs = this.getDb().get(sentenciaSolicitudes);
            System.out.println(sentenciaSolicitudes);
            
            
            int contadorPermisos=0;
  			while(rs.next()){
  				String[] el = {rs.getString("smn_personal_id"),rs.getString("spe_fecha_desde"),rs.getString("spe_fecha_hasta"),rs.getString("spe_estatus_rf")};
  				salida.add(el);
  				contadorPermisos++;
  				
  			}

			System.out.println(": PERMISOS TOTALES: "+contadorPermisos);
            
		} catch (SQLException e) {
//			System.out.println(timestamp+":Error al cambiar el 'cpa_status' a 'GE' en el plan: smn_control_acceso.smn_plan_asistencia="+idPlanAsistencia);
			System.out.println(timestamp+": ERROR: "+e);

		
		}
		
		return salida;
	}

	public String buscarEnPermisos(String id,String fechaDelDia,ArrayList<String[]> permisos) {
		String respuesta ="";
//		System.out.println("**: "+id+" **");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");    
        Calendar cini = Calendar.getInstance();
        try {
        	for (int xyz = 0; xyz < permisos.size(); xyz++) {
        		String[] permiso = permisos.get(xyz);
        		//EL OBJETO PERMISO POSEE 4 POSICIONES SEGUN LA TABLA DE "SOLICITUD DE PERMISOSO"
        		//0 => id del personal 
        		//1=> fecha de INICIO del PERMISO
        		//2=> fecha de fin del PERMINO 
        		//3=> EStado del Permiso
        		if(permiso[0].equalsIgnoreCase(id)) {// SI ES LA PERSONA DE LA ASISTENCIA QUE SE ESTA RECORRIENDO
//        			System.out.println("SI: "+permiso[0]+" "+permiso[1]+" "+permiso[2]+" "+permiso[3]);
        			cini.setTime(formatter.parse(permiso[1]));
		            Calendar cfin = Calendar.getInstance();
		            cfin.setTime(formatter.parse(permiso[2]));
            		if(permiso[3].equalsIgnoreCase("APR")) {
                        //SE RECORREN LOS DIAS DE LOS PERMISOS SOLICITADOS
			            while (cfin.after(cini) || cfin.equals(cini)) {
			            	String fechaFor = formatter.format(cini.getTime());
			            	if(fechaFor.equalsIgnoreCase(fechaDelDia)) {
			            			respuesta = "S";
			            			
			            			break;
			            	}
			            	cini.add(Calendar.DATE, 1);

	                    }//WHIULE
            		}//DEL IF "APROBADO"
            		
        		}//NO ES EL MISMO
        		else {
//        			System.out.print("NO : "+permiso[0]+" "+permiso[1]+" "+permiso[2]+" "+permiso[3]+"  /");
        			

        		}
        		
			}
        	
        }
        catch (ParseException e2) {
            e2.printStackTrace();
            System.out.println(":Error al recorrer los permido de ID:("+id+")");
            System.out.println("buscarEnPermisos() :"+e2);

        }
		
		
		return respuesta;
	}
}
