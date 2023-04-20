package procesos;

import java.io.FileWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import dinamica.Db;
import dinamica.Recordset;

public class horarios {

	public int smn_horarios_id;
	public String hor_hora_inicio, hor_hora_final, hor_descanso_inicio, hor_descanso_final;
	public int smn_turnos_id;
	public FileWriter fw;
	public Db db;
	
	public horarios() {

	}
	public horarios(FileWriter f) {
		this.fw = f;
	}

	public Db getDb() {
		return db;
	}

	public void setDb(Db db) {
		this.db = db;
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

	
	public FileWriter getFw() {
		return fw;
	}

	public void setFw(FileWriter fw) {
		this.fw = fw;
	}
	
	public ArrayList<horarios> listaHorarios(Db db) throws Throwable{
        ArrayList<horarios> dias = new ArrayList<horarios>();
		 Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//		 System.out.println(timestamp);
		 
        try {
      		String sentecia="select * from  smn_gip.smn_horarios";
//            System.out.println("DB: "+db);
      		Recordset rs = db.get(sentecia);
      		int i = 0;
      		while(rs.next()){
                i++;
         		
                int id=0;
                if(rs.getString("smn_horarios_id")!=null) {
                	id = rs.getInt("smn_horarios_id");
                }
                int idTurno = 0;
                if(rs.getString("smn_turnos_id")!=null) {
                	idTurno = rs.getInt("smn_turnos_id");
                }
                
                
                horarios obj = new horarios(id,rs.getString("hor_hora_inicio"),rs.getString("hor_hora_final"),rs.getString("hor_descanso_inicio"),rs.getString("hor_descanso_final"),idTurno);
            	dias.add(obj);
            }
            
		
		} catch (Exception e) {
			System.out.println("NONES : " +e);
			System.out.println(timestamp+": *** Lista de Horarios No disponible ***\n");
			System.out.println(timestamp+": ERROR: "+e);

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
