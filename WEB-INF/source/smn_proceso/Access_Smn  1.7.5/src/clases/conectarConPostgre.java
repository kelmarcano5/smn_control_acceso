package clases;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conectarConPostgre {
	 private Connection cn;
	  private String host="";
	  private String port ="";
	  private String dbName="";
	  private String user="";
	  private String pass="";
	  private String codAccess="";
	  private String configIni = "ini.txt";
	  
	  
//////////////////////////////////////
	  
	  
	  public String error; 

	
	  public conectarConPostgre(String host, String dbName, String user, String pass) {
		super();
		this.host = host;
		this.dbName = dbName;
		this.user = user;
		this.pass = pass;
	}

	public conectarConPostgre() {
		super();
	}

	public Connection getCn() {
		return cn;
	}

	public void setCn(Connection cn) {
		this.cn = cn;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}
	  
	
	  public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
	
	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getConfigIni() {
		return configIni;
	}

	public void setConfigIni(String configIni) {
		this.configIni = configIni;
	}
	
	

	public String getCodAccess() {
		return codAccess;
	}

	public void setCodAccess(String codAccess) {
		this.codAccess = codAccess;
	}

	public boolean getInfoInicial(){
		boolean ret = false;
		String cadena;
        FileReader f;

		String m = "";

    	
	      try {
	  			
	  		if(!new File(configIni).exists()){
				m="NO EXISTE Archivo "+configIni;
	  			System.out.println(m);
	  			this.setError(m);

	  			
	  		}else {
		    	  f = new FileReader(configIni);
			      BufferedReader b = new BufferedReader(f);
			      String STR ="";
			      while((cadena = b.readLine())!=null) {
			          STR+=cadena;
			      }

			      String[] arr = STR.split(";");
			      if(arr.length!=6) {
						m="Error: Por favor verifique los datos del archivo ini.txt";
			  			System.out.println(m);
			  			this.setError(m);

			      }else {
				      //HOST
				      String[] hst = arr[0].split("=");
			          this.setHost(hst[1]);
			          
				      //PUERTO
				      String[] prt = arr[1].split("=");
			          this.setPort(prt[1]);
	 
			          //DATABASE NAME
				      String[] dbn = arr[2].split("=");
			          this.setDbName(dbn[1]);

				      //USER NAME
				      String[] usr = arr[3].split("=");
			          this.setUser(usr[1]);
			          
				      //PASSWORD
				      String[] pwd = arr[4].split("=");
			          this.setPass(pwd[1]);

				      String[] codAccs = arr[5].split("=");
					  this.setCodAccess(codAccs[1]);
			    	  ret = true;
			      }

		          b.close();

	  		}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m="Error al verificar ini.txt: ";
			m+="/n"+e;
  			System.out.println(m);
  			this.setError(m);
  			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m="Error al verificar ini.txt: ";
			m+="/n"+e;
  			System.out.println(m);
  			this.setError(m);

		}
		
		return ret;
	}
	

	public Connection conectar(){
		    Connection link = null;

		    try {	
		    	
			    if(this.getInfoInicial()){
					Class.forName("org.postgresql.Driver");
					try {
						link=this.cn = DriverManager.getConnection(
						      "jdbc:postgresql://"+this.host +":"+this.port+"/" + this.dbName, 
						      this.user, this.pass);						
						System.out.println("\nConexion establecida con Postgers:"+link+" \n");    	

						
						} catch (SQLException e) {
							String m = "ERROR AL CONECTARCE A BASE DE DATOS EN: "+this.getDbName();
							m+="/n"+e;
							this.setError(m);
							System.out.println(m);
						} 
			    }

	            } catch (ClassNotFoundException e) {

	            	String m = "ERROR AL CONECTARCE A, VERIFIQUE EL CONTROLADOR: ";
					m+="/n"+e;
					this.setError(m);
					System.out.println(m);

	            } 

		        return link;
	}
	  

}
