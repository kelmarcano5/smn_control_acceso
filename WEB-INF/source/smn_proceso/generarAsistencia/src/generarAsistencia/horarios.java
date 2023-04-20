package generarAsistencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.log4j.Logger;

public class horarios {
	public final static Logger logger = Logger.getLogger(asistencia.class);

	public int smn_horarios_id;
	public String hor_hora_inicio, hor_hora_final, hor_descanso_inicio, hor_descanso_final;
	public int smn_turnos_id;
	
	public horarios() {

	}

	public horarios(int smn_horarios_id, String hor_hora_inicio, String hor_hora_final, String hor_descanso_inicio,
			String hor_descanso_final, int smn_turnos_id) {
		super();
		this.smn_horarios_id = smn_horarios_id;
		this.hor_hora_inicio = hor_hora_inicio;
		this.hor_hora_final = hor_hora_final;
		this.hor_descanso_inicio = hor_descanso_inicio;
		this.hor_descanso_final = hor_descanso_final;
		this.smn_turnos_id = smn_turnos_id;
	}

	public int getSmn_horarios_id() {
		return smn_horarios_id;
	}

	public void setSmn_horarios_id(int smn_horarios_id) {
		this.smn_horarios_id = smn_horarios_id;
	}

	public String getHor_hora_inicio() {
		return hor_hora_inicio;
	}

	public void setHor_hora_inicio(String hor_hora_inicio) {
		this.hor_hora_inicio = hor_hora_inicio;
	}

	public String getHor_hora_final() {
		return hor_hora_final;
	}

	public void setHor_hora_final(String hor_hora_final) {
		this.hor_hora_final = hor_hora_final;
	}

	public String getHor_descanso_inicio() {
		return hor_descanso_inicio;
	}

	public void setHor_descanso_inicio(String hor_descanso_inicio) {
		this.hor_descanso_inicio = hor_descanso_inicio;
	}

	public String getHor_descanso_final() {
		return hor_descanso_final;
	}

	public void setHor_descanso_final(String hor_descanso_final) {
		this.hor_descanso_final = hor_descanso_final;
	}

	public int getSmn_turnos_id() {
		return smn_turnos_id;
	}

	public void setSmn_turnos_id(int smn_turnos_id) {
		this.smn_turnos_id = smn_turnos_id;
	}

	
	public ArrayList<horarios> listaHorarios(Connection con){
        ArrayList<horarios> dias = new ArrayList<horarios>();
        try {
           	Statement sql=null;
      		ResultSet rs=null;
      		String sentecia="select * from  smn_gip.smn_horarios";
      		
      		sql=con.createStatement();
            rs=sql.executeQuery(sentecia);
            while(rs.next()){
            	
            	horarios obj = new horarios(rs.getInt("smn_horarios_id"),rs.getString("hor_hora_inicio"),rs.getString("hor_hora_final"),rs.getString("hor_descanso_inicio"),rs.getString("hor_descanso_final"),rs.getInt("smn_turnos_id"));
            	dias.add(obj);
            	
            }
            
		
		} catch (Exception e) {
    		logger.info("*** Lista de Horarios No disponible ***\n");
    		logger.error("ERROR: "+e);

		}
		return dias;
	}

	public horarios buscarHorario(ArrayList<horarios> dias,int id){
		horarios h = new horarios();

		for (int j = 0; j < dias.size(); j++) {
			horarios el = dias.get(j);
			if(el.getSmn_horarios_id()==id) {
				h = el;
				break;
			}
		}
		
		return h;
	}
	
	
}
