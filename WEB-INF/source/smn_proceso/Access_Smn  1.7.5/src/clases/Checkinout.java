package clases;

import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;

import javax.script.ScriptException;

import org.apache.log4j.Logger;


public class Checkinout {
	public int loginId;
	public String userId;
	public String checkTime;
	public String checkType;
	public String sensorId;
	public boolean checked;
	public int workType;
	public int attFlag;
	public boolean openDoorFlag;
	public String horaTrans;
	public String sede;

	public final static Logger logger = Logger.getLogger(Checkinout.class);

	public String getSede() {
		return sede;
	}
	

	public void setSede(String sede) {
		this.sede = sede;
	}


	public Connection cnAccess,cnPostgre;
	public boolean existeUno = false,estatusTransaccion;
	public String errorOcurrido;

	
	public Checkinout() {
		super();
	}

	public Checkinout(int loginId, String userId, String checkTime, String checkType, String sensorId, boolean checked,
			int workType, int attFlag, boolean openDoorFlag) {
		super();
		this.loginId = loginId;
		this.userId = userId;
		this.checkTime = checkTime;
		this.checkType = checkType;
		this.sensorId = sensorId;
		this.checked = checked;
		this.workType = workType;
		this.attFlag = attFlag;
		this.openDoorFlag = openDoorFlag;
	}

	public Checkinout(int loginId, String userId, String checkTime, String checkType, String sensorId, boolean checked) {
		super();
		this.loginId = loginId;
		this.userId = userId;
		this.checkTime = checkTime;
		this.checkType = checkType;
		this.sensorId = sensorId;
		this.checked = checked;
	}

	
	public int getLoginId() {
		return loginId;
	}

	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public String getCheckType() {
		return checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}

	public String getSensorId() {
		return sensorId;
	}

	public void setSensorId(String sensorId) {
		this.sensorId = sensorId;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public int getWorkType() {
		return workType;
	}

	public void setWorkType(int workType) {
		this.workType = workType;
	}

	public int getAttFlag() {
		return attFlag;
	}

	public void setAttFlag(int attFlag) {
		this.attFlag = attFlag;
	}

	public boolean isOpenDoorFlag() {
		return openDoorFlag;
	}

	public void setOpenDoorFlag(boolean openDoorFlag) {
		this.openDoorFlag = openDoorFlag;
	}
	
	
//	GET's Y SET's para la CONEXION

	public boolean isExisteUno() {
		return existeUno;
	}

	public Connection getCnAccess() {
		return cnAccess;
	}

	public void setCnAccess(Connection cnAccess) {
		this.cnAccess = cnAccess;
	}

	public Connection getCnPostgre() {
		return cnPostgre;
	}

	public void setCnPostgre(Connection cnPostgre) {
		this.cnPostgre = cnPostgre;
	}

	public void setExisteUno(boolean existeUno) {
		this.existeUno = existeUno;
	}

	public boolean isEstatusTransaccion() {
		return estatusTransaccion;
	}

	public void setEstatusTransaccion(boolean estatusTransaccion) {
		this.estatusTransaccion = estatusTransaccion;
	}

	public String getErrorOcurrido() {
		return errorOcurrido;
	}

	public void setErrorOcurrido(String errorOcurrido) {
		this.errorOcurrido = errorOcurrido;
	}
	
    public String getHoraTrans() {
		return horaTrans;
	}

	public void setHoraTrans(String horaTrans) {
		this.horaTrans = horaTrans;
	}

	
	///////////////////////////////////////////////////////////////////
	///////////////// FUNCIONES /////////////////////////////////////////
	
	public boolean conectarseaBD_Access() {
		boolean r = true;

	    if (this.getCnAccess() == null) {//PARA VER SI YA ESTABA ESTABLECIDA

	    	conectarConAccess mysql = new conectarConAccess();
	    	this.setCnAccess(mysql.conectar());
		    if (this.getCnAccess() == null) {
		        r = false;
		        this.setErrorOcurrido(mysql.getError());
	    		this.imprimirEnLog("_ *** Conexion NO establecida con ACCESS ***\n");
	    		this.imprimirEnLog(mysql.getError());
		    }
	    }
	    return r;
    }
    
    public boolean conectarseaBD_Postgre(){
    	boolean r = true;
    	if(this.getCnPostgre()==null) {//EN CASO DE QUE NO ESTE ESTABLECIDA LA CONEXION, SE REINTENTA SINO SE OMITE
    		conectarConPostgre cnP = new conectarConPostgre();
        	this.setCnPostgre(cnP.conectar());
        	if(this.getCnPostgre()==null) {
        		r = false;
        		this.setErrorOcurrido(cnP.getError());
        		this.imprimirEnLog("_ *** Conexion NO establecida con POSTGRESQL ***\n");
	    		this.imprimirEnLog(cnP.getError());
        	}
    		
    		
    	}

    	
    	return r;
    }
    
    public void leerDatosAccess() throws SQLException {
		this.setEstatusTransaccion(true);
		this.setErrorOcurrido("");
		this.imprimirEnLog("--------- INICIA leerDatosAccess() ---------\n");
		String msj="";
  		if(conectarseaBD_Access()) {
    		Statement sql=null;
      		ResultSet rs=null;
        	System.out.println("INICIA leerDatosAccess()");
      		
      		try {

      			String sqlS = "Select * from Checkinout where Checked=false";
      			
      			
                sql=this.getCnAccess().createStatement();
                rs=sql.executeQuery(sqlS);
                int c=0;
                
      			String idElementosSinSEDE="",//toma USERID de access CUANDO HAY PROBLEMAS en buscar su sede
      					idElementosSinSEDE2="",// toma el USERID de acces CUANDO NO HAY PROBLEMAS PERO NO TIENE ASIGNADO SEDE
      					idElementosNoIsertadosEn_smn_transacciones="",
      					idElementosNoCAmbiadoEn_checkinout="",
						idsPersonal_C_A="",
      					idsPersonal_C_A2="";

      			int fine=0;

      			System.out.println("**********************************************************************");
      			System.out.println("CONECION DE POSTGRE PRINCIPAL: "+this.conectarseaBD_Postgre());
      			System.out.println("**********************************************************************");
      			String aux;
      			while(rs.next()){
      				aux="";
       				String err="";
       				Checkinout elementoCheckIntOut = new Checkinout();

      				c++;
            		String completa ="";
            		String completa2 ="";
            		java.sql.Timestamp time = rs.getTimestamp("CheckTime");
            		Time time2 = rs.getTime("CheckTime");
            		completa = String.valueOf(time);
            		completa2 = String.valueOf(time2);
          			String[] partesH = completa2.split(":");
          			String tipo ="SAL";
          			String horaTrans= partesH[0]+":"+partesH[1];
          			if(rs.getString("CheckType").equalsIgnoreCase("I")) {
              			tipo ="ENT";
          			}
          			
//          			Checkinout elementoCheckIntOut = new Checkinout(rs.getInt("Logid"), rs.getString("Userid"), completa,tipo,rs.getString("Sensorid"),rs.getBoolean("Checked"));
          			
          			elementoCheckIntOut = new Checkinout(rs.getInt("Logid"), rs.getString("Userid"), completa,tipo,rs.getString("Sensorid"),rs.getBoolean("Checked"));
          			elementoCheckIntOut.setUserId(rs.getString("Userid"));
          			elementoCheckIntOut.setHoraTrans(horaTrans);
          			elementoCheckIntOut.setErrorOcurrido("");


                	/*************************************************************
                	 **	 		PARA NO CONECTAR VARIAS VECES					**
                	 *************************************************************/

          			/*AQUI YA SE INICIO CONCECCION CON ACCESS Y SE ASIGNA A LOS REGISTROS (OBJETOS) "NUEVOS" PARA NO REDUNDAR O RECONECTAR */
                	elementoCheckIntOut.setCnAccess(this.getCnAccess());
                	
                	/*AQUI YA SE INICIO CONCECCION CON POSTGRES Y SE ASIGNA A LOS REGISTROS (OBJETOS) "NUEVOS" PARA NO REDUNDAR O RECONECTAR */
                	elementoCheckIntOut.setCnPostgre(this.getCnPostgre());
                	/*************************************************************
                	 **	 														**
                	 *************************************************************/

                	
                	
                	boolean ss = elementoCheckIntOut.buscarEnSmnPersonal();
                	
                	if(elementoCheckIntOut.isEstatusTransaccion()){
                    	if(!ss){
                    		idsPersonal_C_A+=elementoCheckIntOut.getUserId()+",";
                    	}

                		boolean busca1 = elementoCheckIntOut.extraerSede();

                		if(elementoCheckIntOut.isEstatusTransaccion()){
                    		if(!busca1) {
                    			elementoCheckIntOut.setSede("SIN SEDE");
                        		idElementosSinSEDE2+=" "+elementoCheckIntOut.getLoginId()+"("+elementoCheckIntOut.getSensorId()+") ,";
                    		}
                			
          					elementoCheckIntOut.cambioCheckAccess(true);
          					if(elementoCheckIntOut.isEstatusTransaccion()){
               		
	              				elementoCheckIntOut.insertarEnPostgres();
	              				if(elementoCheckIntOut.isEstatusTransaccion()) {
	           						fine++;
//             						aux="Guardando.";
             						
                  				}else {
                  					
                  					idElementosNoIsertadosEn_smn_transacciones+=elementoCheckIntOut.getLoginId()+",";
                      				err="_ *Error con el Registro Logid("+elementoCheckIntOut.getLoginId()+"): "+elementoCheckIntOut.getErrorOcurrido();

                      				//Restablecer el valor a :FALSE: en Access para que sea procesado de nuevo
                  					elementoCheckIntOut.cambioCheckAccess(false);


                  				}

              						
          					}else {
          						idElementosNoCAmbiadoEn_checkinout+=elementoCheckIntOut.getLoginId()+",";
                  				err="_ *Error con el Registro Logid("+elementoCheckIntOut.getLoginId()+"): "+elementoCheckIntOut.getErrorOcurrido();
          					}

                		}else {

                    		idElementosSinSEDE+=elementoCheckIntOut.getLoginId()+",";
              				err="_ *Error con el Registro Logid("+elementoCheckIntOut.getLoginId()+"): "+elementoCheckIntOut.getErrorOcurrido();
              			}
                	}else {
                		idsPersonal_C_A2+=elementoCheckIntOut.getUserId()+",";
                		err="_ *Error con el Registro Logid("+elementoCheckIntOut.getLoginId()+"): "+elementoCheckIntOut.getErrorOcurrido();
                	}
                	

                	
          			if(err!=""){
              			this.imprimirEnLog(err);
          			}
            	}//DEL WHILE
       			
       			if(idElementosSinSEDE=="") {
       				idElementosSinSEDE=" -";
       			}

       			if(idElementosSinSEDE2=="") {
       				idElementosSinSEDE2=" -";
       			}

       			if(idElementosNoCAmbiadoEn_checkinout=="") {
       				idElementosNoCAmbiadoEn_checkinout=" -";
       			}
       			if(idElementosNoCAmbiadoEn_checkinout=="") {
       				idElementosNoCAmbiadoEn_checkinout=" -";
       			}

       			if(idsPersonal_C_A=="") {
       				idsPersonal_C_A=" -";
       			}

       			if(idsPersonal_C_A2=="") {
       				idsPersonal_C_A2=" -";
       			}

       			
            	msj+="\n\n_ Cantida de elementos leidos: "+c+" registros\n";          	
            	msj+="_ Cantida de elementos procesados correctamente: ("+fine+")\n";
            	msj+="_ Id de elementos NO procesados ("+(c-fine)+"): \n";
            	msj+="   _Con problemas en Asignar SEDE :"+idElementosSinSEDE+"\n";
            	msj+="   _Con problemas en Insertar en smn_transacciones :"+idElementosNoIsertadosEn_smn_transacciones+"\n";
            	msj+="   _Con problemas en Cambiar estado de CHECKED en ACCESS :"+idElementosNoCAmbiadoEn_checkinout+"\n";
            	msj+="   _Con problemas en buscar en tabla estado de 'smn_control_acceso'.'smn_personal':"+idsPersonal_C_A2+"\n";

            	
            	msj+="\n_ =========================================\n";
            	msj+="_ Id's de personal que se le asigno 'SIN SEDE' en smn_transacciones.trn_sede : "+idElementosSinSEDE2+"\n";
            	msj+="_ =========================================\n";

            	msj+="\n_ =========================================\n";
            	msj+="_ UsersId's de Personal no registrados en 'smn_control_acceso'.'smn_personal' : "+idsPersonal_C_A+"\n";
            	msj+="_ =========================================\n";
            	
            	System.out.println("FIN leerDatosAccess()");
            	
      		} catch (Exception e) {
				String m = "_Ha ocurrido un error al leer los datos \t Error:  "+e;
				msj+=m;
				this.setErrorOcurrido(m);
				this.setEstatusTransaccion(false);
				
			}
            
  		
    	}else {
        	System.out.print("No se conecto a ACCESS desde la clase CheckInOut");
    	}

  		this.imprimirEnLog(msj);
  		this.imprimirEnLog("--------- FINALIZA leerDatosAccess() ---------");
  		
  		
    }
    
    public boolean buscarEnSmnPersonal()  throws SQLException {
    	this.setEstatusTransaccion(true);
		this.setErrorOcurrido("");

    	String msj ="";
		boolean salida = false;
    	if(conectarseaBD_Postgre()) {

    		Statement sql=null;
      		ResultSet rs=null;
            sql=this.getCnPostgre().createStatement();

            	try {
          	    	String sentencia = "SELECT * FROM smn_control_acceso.smn_personal where psl_id_control_acceso='"+this.getUserId()+"';";

          	    	rs=sql.executeQuery(sentencia );
          			if(rs.next()){
          				salida = true;
          			}
    			} catch (Exception e) {
    				String m = "_ No se ha podido consultar la tabla 'smn_gip.smn_dispositivos' \t Error:  "+e;
    				msj+=m;
    				this.setErrorOcurrido(m);
    				this.setEstatusTransaccion(false);

    			}
    	}else {
        	System.out.print("No se conecto a POSTGRES desde la clase CheckInOut");
			this.setEstatusTransaccion(false);
			msj+="_ No se conecto a POSTGRES desde la clase CheckInOut\n";

    	}
    	if(!msj.equals(""))
    		this.imprimirEnLog(msj);
    	
    	return salida;
    	
    }
    
    public void cambioCheckAccess(boolean cambio) throws SQLException{
    	this.setEstatusTransaccion(true);
		this.setErrorOcurrido("");

		// para el registro 
		String msj ="";
    	if(conectarseaBD_Access()) {
    		String m="";
        		int auxiliar = this.getLoginId(); 
            	try {
                	String SQL ="UPDATE Checkinout SET Checked="+cambio+" WHERE Logid="+auxiliar;
            		int i = this.getCnAccess().createStatement().executeUpdate(SQL);
            		if(i>0){
            			this.setEstatusTransaccion(true);
            		}else {
    					m+= "No se ha podido MODIFICAR en  la tabla 'Checkinout' \t Error: NO executeUpdate()  ";
    					this.setErrorOcurrido(m);
    					this.setEstatusTransaccion(false);

            		}
    			} catch (SQLException e) {
    				m = "_ No se ha podido MODIFICAR la tabla 'Checkinout' \t Error:  "+e;
    				msj+=m;
    				this.setErrorOcurrido(m);
    				this.setEstatusTransaccion(false);

    			}
    	}else {
        	System.out.print("No se conecto a ACCESS desde la clase CheckInOut");
      		msj+="_ No se conecto a ACCESS desde la clase CheckInOut\n";
    	}
    	if(!msj.equals(""))
    		this.imprimirEnLog(msj);
    }


    public void insertarEnPostgres() throws SQLException {
    	this.setEstatusTransaccion(true);
		this.setErrorOcurrido("");
		// para el registro 
		String msj ="";

    	if(conectarseaBD_Postgre()) {

    	      String horaActual = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
    	      String fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			

				try {
					

					String SQL ="INSERT INTO smn_control_acceso.smn_transacciones("
							+ "smn_transacciones_id, "
							+ "trn_sede, "
	      					+ "trn_dispositivo, "
	      					+ "trn_identificacion,"
	      					+ "trn_marcaje, "
	      					+ "trn_tipo_marcaje, "
	      					+ "trn_fecha_transaccion, "
	      					+ "trn_hora_transaccion,"
	      					+ "trn_tipo_transaccion, "
	      					+ "trn_procesada, "
	      					+ "trn_idioma, "
	      					+ "trn_usuario,"
	      					+ "trn_fecha_registro, "
	      					+ "trn_hora)"
	      					+"	VALUES("
	      					+"nextval('smn_control_acceso.seq_smn_transacciones'),"
							+ "'"+this.getSede()+"', "
							+"'"+this.getSensorId()+"',"
							+"'"+this.getUserId()+ "',"
	      					+ this.getLoginId()+","
							+"'"+this.getCheckType()+"',"
							+"'"+this.getCheckTime()+"',"
							+"'"+this.getHoraTrans()+"',"
							+ "'AUT',"
							+ "'N',"
							+ "'es',"
							+ "'admin',"
							+ "'"+fechaActual+"',"
							+ "'"+horaActual+"'"
							+ ");";

					int n = this.getCnPostgre().createStatement().executeUpdate(SQL);

	                if (n > 0) {
	                    this.setEstatusTransaccion(true);
	                }else {
	    				String m = "_ No se ha podido Insertar en  la tabla 'smn_control_acceso.smn_transacciones' \t Error: NO executeUpdate()";
	    				msj+=m;
	    				this.setErrorOcurrido(m);
	    				this.setEstatusTransaccion(false);
	                }
	                
	      		} catch (Exception e) {
					String m = "_ No se ha podido Insertar en  la tabla 'smn_control_acceso.smn_transacciones' \t Error:  "+e;
    				msj+=m;
					this.setErrorOcurrido(m);
					this.setEstatusTransaccion(false);

				}

    	}else {
        	System.out.print("No se conecto a POSTGRES desde la clase CheckInOut");
			this.setEstatusTransaccion(false);

    	}
    	
    	if(!msj.equals(""))
    		this.imprimirEnLog(msj);
    }//DEL LA FUNCION INSERTA EN POSTGRESQL
    

    public boolean extraerSede() throws SQLException{
    	boolean encontrado = false;
    	this.setEstatusTransaccion(false);
		this.setErrorOcurrido("");
		String msj ="";

    	if(conectarseaBD_Postgre()) {

    		Statement sql=null;
      		ResultSet rs=null;
            sql=this.getCnPostgre().createStatement();
 	  		
          		try {
          			String Sql ="SELECT smn_sedes_id FROM smn_gip.smn_dispositivos WHERE smn_dispositivos_id="+this.getSensorId()+";";

          			 rs=sql.executeQuery(Sql);

          			if(rs.next()){
                    	this.setSede(String.valueOf(rs.getInt("smn_sedes_id")));
                    	encontrado=true;
          			}else {
        				this.setErrorOcurrido("No coinciden 'smn_dispositivos_id' en 'smn_gip.smn_dispositivos' con el id del 'Sensorid' ("+this.getSensorId()+")");
                    }
          			
    				this.setEstatusTransaccion(true);

          		} catch (Exception e) {
    				String m = "_ No se ha podido consultar la tabla 'smn_gip.smn_dispositivos' \t Error:  "+e;
    				msj+=m;
    				this.setErrorOcurrido(m);

    			}
    	}else {
        	System.out.print("No se conecto a POSTGRES desde la clase CheckInOut");
			msj+="_ No se conecto a POSTGRES desde la clase CheckInOut\n";

    	}
//  		msj+="_FINALIZA extraerSede()\n";
    	if(!msj.equals(""))
    		this.imprimirEnLog(msj);
    	return encontrado;
    }
	
    
    /*
     * TRAZA
     */
    
    public void imprimirEnLog(String mensaje){
//    	FileWriter archivo;
//    	File carpeta;
//  			try {
//
//  				if(!new File("logAccessSimone.txt").exists()){
//  					System.out.println("NO EXISTE Archivo log \n CREANDO ARCHIVO...");
//  					archivo = new FileWriter("logAccessSimone.txt",false);
//  				}
//  				
//  				archivo = new FileWriter("logAccessSimone.txt",true);
//  				archivo.write(mensaje+"\n");
//  				archivo.close();
//
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//				System.out.println("ERROR AL IMPRIMIR EN TRAZA : "+e);
//			}
			logger.info(mensaje);
    }
    
    
}
