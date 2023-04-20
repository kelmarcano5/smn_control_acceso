package ComparativoMarcaje;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;

import org.apache.log4j.Logger;

import ComparativoMarcaje.horarios;

public class movimientoMarcaje {
	public final static Logger logger = Logger.getLogger(movimientoMarcaje.class);

	public int idMovMarcaje;//	smn_mov_marcaje_id
	public int transaccion;//	smn_transaccion_id
	public String controlAcceso;//	mrk_control_acceso_id
	public String personal;//	smn_personal_rf
	public String codDispositivo;//	mrk_dispositivo_rf
	public int documentoId;//	smn_documento_id
	public int documentoNum;//	smn_documento_numero
	public String sede;//	smn_sede_id
	public int empresa;//	smn_entidad_rf
	public int sucursal;//	smn_sucursal_rf
	public int area;//	smn_area_rf
	public int unidadServicio;//	smn_unidad_servicio_rf
	public int centroCosto;//	smn_centro_costo_rf
	public int cargo;//	smn_cargo_rf
	public int categoriaCargo;//	smn_categoria_cargo_rf
	public String tipoMarcaje;//	mrk_marcaje_tipo
	public String consecutivo;//	mrk_consecutivo
	public String marcajeDia;//		mrk_marcaje_dia
	public int horario;//		smn_horario_id
	public String marcajeFecha;//	mrk_marcaje_fecha
	public String marcajeHora;//	mrk_marcaje_hora

		
	public String error;
	public String errorOcurrido;

	public Connection cnPostgre;
	
	
	
	
	
	
	public movimientoMarcaje() {
		
	}
	
	public movimientoMarcaje(int idMovMarcaje, int transaccion, String controlAcceso, String personal,
			String codDispositivo, int documentoId, int documentoNum, String sede, int empresa, int sucursal, int area,
			int unidadServicio, int centroCosto, int cargo, int categoriaCargo, String tipoMarcaje, String consecutivo,
			String marcajeDia, int horario, String marcajeFecha, String marcajeHora) {
		super();
		this.idMovMarcaje = idMovMarcaje;
		this.transaccion = transaccion;
		this.controlAcceso = controlAcceso;
		this.personal = personal;
		this.codDispositivo = codDispositivo;
		this.documentoId = documentoId;
		this.documentoNum = documentoNum;
		this.sede = sede;
		this.empresa = empresa;
		this.sucursal = sucursal;
		this.area = area;
		this.unidadServicio = unidadServicio;
		this.centroCosto = centroCosto;
		this.cargo = cargo;
		this.categoriaCargo = categoriaCargo;
		this.tipoMarcaje = tipoMarcaje;
		this.consecutivo = consecutivo;
		this.marcajeDia = marcajeDia;
		this.horario = horario;
		this.marcajeFecha = marcajeFecha;
		this.marcajeHora = marcajeHora;
	}







	public int getIdMovMarcaje() {
		return idMovMarcaje;
	}

	public void setIdMovMarcaje(int idMovMarcaje) {
		this.idMovMarcaje = idMovMarcaje;
	}

	public int getTransaccion() {
		return transaccion;
	}

	public void setTransaccion(int transaccion) {
		this.transaccion = transaccion;
	}

	public String getControlAcceso() {
		return controlAcceso;
	}

	public void setControlAcceso(String controlAcceso) {
		this.controlAcceso = controlAcceso;
	}

	public String getPersonal() {
		return personal;
	}

	public void setPersonal(String personal) {
		this.personal = personal;
	}

	public String getCodDispositivo() {
		return codDispositivo;
	}

	public void setCodDispositivo(String codDispositivo) {
		this.codDispositivo = codDispositivo;
	}

	public int getDocumentoId() {
		return documentoId;
	}

	public void setDocumentoId(int documentoId) {
		this.documentoId = documentoId;
	}

	public int getDocumentoNum() {
		return documentoNum;
	}

	public void setDocumentoNum(int documentoNum) {
		this.documentoNum = documentoNum;
	}

	public String getSede() {
		return sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}

	public int getEmpresa() {
		return empresa;
	}

	public void setEmpresa(int empresa) {
		this.empresa = empresa;
	}

	public int getSucursal() {
		return sucursal;
	}

	public void setSucursal(int sucursal) {
		this.sucursal = sucursal;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public int getUnidadServicio() {
		return unidadServicio;
	}

	public void setUnidadServicio(int unidadServicio) {
		this.unidadServicio = unidadServicio;
	}

	public int getCentroCosto() {
		return centroCosto;
	}

	public void setCentroCosto(int centroCosto) {
		this.centroCosto = centroCosto;
	}

	public int getCargo() {
		return cargo;
	}

	public void setCargo(int cargo) {
		this.cargo = cargo;
	}

	public int getCategoriaCargo() {
		return categoriaCargo;
	}

	public void setCategoriaCargo(int categoriaCargo) {
		this.categoriaCargo = categoriaCargo;
	}

	public String getTipoMarcaje() {
		return tipoMarcaje;
	}

	public void setTipoMarcaje(String tipoMarcaje) {
		this.tipoMarcaje = tipoMarcaje;
	}

	public String getConsecutivo() {
		return consecutivo;
	}

	public void setConsecutivo(String consecutivo) {
		this.consecutivo = consecutivo;
	}

	public String getMarcajeDia() {
		return marcajeDia;
	}

	public void setMarcajeDia(String marcajeDia) {
		this.marcajeDia = marcajeDia;
	}

	public int getHorario() {
		return horario;
	}

	public void setHorario(int horario) {
		this.horario = horario;
	}

	public String getMarcajeFecha() {
		return marcajeFecha;
	}

	public void setMarcajeFecha(String marcajeFecha) {
		this.marcajeFecha = marcajeFecha;
	}

	public String getMarcajeHora() {
		return marcajeHora;
	}

	public void setMarcajeHora(String marcajeHora) {
		this.marcajeHora = marcajeHora;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

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
	public ArrayList<movimientoMarcaje> listaMovMarcaje(Connection con,String diaInicio,String diaFin,String horaActual){
        ArrayList<movimientoMarcaje> movimientoMarcajes = new ArrayList<movimientoMarcaje>();
        if(diaInicio.equals("0000-00-00") || diaFin.equals("0000-00-00")) {
        	
        }else {
	        try {
	           	Statement sql=null;
	      		ResultSet rs=null;
				String sentencia = "Select * From smn_control_acceso.smn_mov_marcajes " +
	//			"where mrk_marcaje_fecha BETWEEN '"+diaAnterior+" 00:00:00' and '"+diaAnterior+" 23:59:59.998'";
				"where mrk_marcaje_fecha BETWEEN '"+diaInicio+" 00:00:00' and '"+diaFin+" "+horaActual+".000' "
				+ " order by mrk_marcaje_fecha asc";
				System.out.println(sentencia);
	      		sql=con.createStatement();
	            rs=sql.executeQuery(sentencia);
	            while(rs.next()){
	            	
	            	/*
	            	 * (int idMovMarcaje,
	            	 * int transaccion,
	            	 * String controlAcceso,
	            	 * String personal,
	            	 * String codDispositivo,
	            	 * int documentoId,
	            	 * int documentoNum,
	            	 * String sede,
	            	 * int empresa,
	            	 * int sucursal,
	            	 * int area,
	            	 * int unidadServicio,
	            	 * int centroCosto,
	            	 * int cargo,
	            	 * int categoriaCargo,
	            	 * String tipoMarcaje,
	            	 * String consecutivo,
	            	 * String marcajeDia,
	            	 * int horario,
	            	 * String marcajeFecha,
	            	 * String marcajeHora
	            	 * )
	            	 * */
	            	
	            	movimientoMarcaje obj = new movimientoMarcaje(rs.getInt("smn_mov_marcajes_id"),
	            			rs.getInt("smn_transaccion_id"),
	            			rs.getString("mrk_control_acceso_id"),
	            			rs.getString("smn_personal_rf"),
	            			rs.getString("mrk_dispositivo_codigo"),
	            			rs.getInt("smn_documento_id"),
	            			0,//rs.getInt("smn_documento_numero"), //NO EXISTE EN BD
	            			rs.getString("smn_sede_id"),
	            			rs.getInt("smn_entidad_rf"),
	            			rs.getInt("smn_sucursal_rf"),
	            			rs.getInt("smn_area_rf"),
	            			rs.getInt("smn_unidad_servicio_rf"),
	            			rs.getInt("smn_centro_costo_rf"),
	            			rs.getInt("smn_cargo_rf"),
	            			rs.getInt("smn_categoria_cargo_rf"),
	            			rs.getString("mrk_marcaje_tipo_rf"),
	            			rs.getString("mrk_consecutivo"),
	            			rs.getString("mrk_marcaje_dia"),
	            			0,//rs.getInt("smn_horario_id"), //NO EXISTE EN BD
	            			rs.getString("mrk_marcaje_fecha"),
	            			rs.getString("mrk_marcaje_hora")
	            			);
	
	            	movimientoMarcajes.add(obj);
	            	/*
	            	 * 	public int idMovMarcaje;//	smn_mov_marcaje_id
						public int transaccion;//	smn_transaccion_id
						public String controlAcceso;//	mrk_control_acceso_id
						public String personal;//	smn_personal_rf
						public String codDispositivo;//	mrk_dispositivo_rf
						public int documentoId;//	smn_documento_id
						public int documentoNum;//	smn_documento_numero
						public String sede;//	smn_sede_id
						public int empresa;//	smn_entidad_rf
						public int sucursal;//	smn_sucursal_rf
						public int area;//	smn_area_rf
						public int unidadServicio;//	smn_unidad_servicio_rf
						public int centroCosto;//	smn_centro_costo_rf
						public int cargo;//	smn_cargo_rf
						public int categoriaCargo;//	smn_categoria_cargo_rf
						public String tipoMarcaje;//	mrk_marcaje_tipo
						public String consecutivo;//	mrk_consecutivo
						public String marcajeDia;//		mrk_marcaje_dia
						public int horario;//		smn_horario_id
						public String marcajeFecha;//	mrk_marcaje_fecha
						public String marcajeHora;//	mrk_marcaje_hora
	            	 * */
	            	
	            	
	            }
	            
			
			} catch (Exception e) {
	    		logger.info("*** Lista de MovMarcaje No disponible ***\n");
	    		logger.error("ERROR: "+e);
				System.err.println("listaMovMarcaje : "+e);
//	
			}
        }//ELSE ERROR 0000-00-00
		return movimientoMarcajes;
	}
	
	public  boolean cambiarEstatus(int id,Connection cn) throws SQLException {
		boolean salida =false;
		try {
			Statement sql=null;
	  		String sentenciaCambio ="UPDATE smn_control_acceso.smn_transacciones " + 
	  				"   SET" + 
	  				"   trn_procesada='S' " + 
	  				" WHERE smn_transacciones_id ="+id;
	  		sql=cn.createStatement();
            int rs=sql.executeUpdate(sentenciaCambio );

            if(rs>0) {
            	salida =true;
            }else {
    			logger.info("No se ha podido MODIFICAR en  la tabla 'smn_control_acceso.smn_transacciones'");
    			logger.error("Error: NO executeUpdate()");
            }
            
	  		
	  		
		} catch (SQLException e) {
			logger.info("Error al cambiar el 'trn_procesada' a 'S' en la transaccion: smn_control_acceso.smn_transacciones="+id);
			logger.error("ERROR: "+e);
		}
		
		return salida;
	}
	

}
