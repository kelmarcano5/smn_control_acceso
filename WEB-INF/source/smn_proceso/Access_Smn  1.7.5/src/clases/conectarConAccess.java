package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class conectarConAccess {
  public String bd="";
  public String url="";
  public String user="";
  public String pass="";
  public String host="";
  public String codAccess="";
  private Checkinout check;
  
  public String getHost() {
	return host;
}
public void setHost(String host) {
	this.host = host;
}
public String error="";
    

    
	public String getBd() {
		return bd;
	}
	public void setBd(String bd) {
		this.bd = bd;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	
	public String getCodAccess() {
		return codAccess;
	}
	public void setCodAccess(String codAccess) {
		this.codAccess = codAccess;
	}
	public conectarConAccess(String bd, String url, String user, String pass, String error) {
		super();
		this.bd = bd;
		this.url = url;
		this.user = user;
		this.pass = pass;
		this.error = error;
	}
	public conectarConAccess() {
		super();
	}
	
	public boolean buscarParametrosAccess() {
		String msj ="";
		boolean rst=false;
		
		conectarConPostgre cnPostgre = new conectarConPostgre();
		Connection cnAccess =  cnPostgre.conectar();
    	if(cnAccess!=null){
    		this.setCodAccess(cnPostgre.getCodAccess());
    		Statement sql=null;
      		ResultSet rs=null;
          		try {
                    sql=cnAccess.createStatement();
         	  		
          			String Sql ="SELECT * FROM smn_base.smn_conexiones WHERE con_sistema='"+this.getCodAccess()+"'";
                    rs=sql.executeQuery(Sql);
                    if(rs.next()){
                    	this.setBd(rs.getString("con_nombre_bd"));
                    	this.setUser(rs.getString("con_usuario_bd"));
                    	this.setHost(rs.getString("con_hostname_instancia"));
                    	rst=true;
                    }else {
                    	check.imprimirEnLog("No existen reglas de conexion para: "+this.getCodAccess());
                    	
                    }
    			} catch (Exception e) {
    				String m = " *********** AQUI************** _ No se ha podido consultar la tabla 'smn_gip.smn_dispositivos' \t Error:  "+e;
    				this.setError(m);
    			}
          		
    	}else {
			msj+="_ No se conecto a POSTGRES desde la clase CheckInOut\n";
			check.imprimirEnLog(msj);
    	}

    	return rst;
	}
	
	  public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	
	
	public Connection conectar(){
		
		    Connection link = null;
		    if(buscarParametrosAccess()){
			    try {
					Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
					try {
						    link=DriverManager.getConnection("jdbc:ucanaccess://"+this.getHost()+this.getBd(),"","");
							System.out.println("\nConexion establecida con access:"+link+"\n");    	


							
						} catch (SQLException e) {
							String m = "ERROR AL CONECTARCE A BASE DE DATOS EN: "+bd;
							m+="/n"+e;
							this.setError(m);
							System.out.println(m);
							
						} 
		            } catch (ClassNotFoundException e) {

		            	String m = "ERROR AL CONECTARCE A, VERIFIQUE EL CONTROLADOR: ";
						m+=e;
						this.setError(m);
						System.out.println(m);

		            } 
		    }else {
            	String m = "ERROR AL CONECTARCE A ACCESS, parametros de conexion incorrectos";
				this.setError(m);
				System.out.println(m);
		    	
		    }

		        return link;
	}
	
}
