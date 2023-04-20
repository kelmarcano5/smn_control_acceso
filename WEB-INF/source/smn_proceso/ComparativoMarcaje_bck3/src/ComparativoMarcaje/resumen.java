package ComparativoMarcaje;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;

public class resumen {
	public final static Logger logger = Logger.getLogger(resumen.class);

	
	public String error;
	public String errorOcurrido;

	public Connection cnPostgre;
	
	
	
	public resumen() {
		super();
	}

	public resumen(String error, String errorOcurrido, Connection cnPostgre) {
		super();
		this.error = error;
		this.errorOcurrido = errorOcurrido;
		this.cnPostgre = cnPostgre;
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

	public void leerListas(ArrayList<asistencia> asistencias, ArrayList<movimientoMarcaje> movimientosMarcajes, ArrayList<String[]> ids,ArrayList<String[]> listaIndividual_All,ArrayList<horarios> dias, String fechaDia,String nombreDia){
		SimpleDateFormat dteFormat = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		int falses = 0;
		int falsesJ = 0;
		int fineU = 0;
		int fineJ =0;
		int fineCom = 0;
		int falseCom = 0;
		
		String noJustifico = "";
		String noComedor = "";
		String noUpdate = "";

		boolean diaLaborable = false;

		
		for (int i = 0; i < ids.size(); i++) {

			String[] persona_id= ids.get(i);
			int idP_aux = 0;
			if(persona_id[0] != null) {
				idP_aux = Integer.parseInt(persona_id[0]);
			}
		
			boolean falto_entradaPrincipal_asi = true;
			

			ArrayList<asistencia> listaPorPersonaAs = this.extraerAsistencias(asistencias, idP_aux,fechaDia);

			ArrayList<String[]> listaPorPersonAsis_All = this.extraerAsistencias_ALL(listaIndividual_All, persona_id[0], fechaDia);
			
			ArrayList<String[]> AsistenciasSal_all_ENT = this.cuantosTiposAsistenciaPorPersonaAll(listaPorPersonAsis_All, "ENT");
			ArrayList<String[]> AsistenciasSal_all_SAL = this.cuantosTiposAsistenciaPorPersonaAll(listaPorPersonAsis_All, "SAL");
			
			String [] nulo = {
        			null,
        			null,
        			null,
        			null,
        			null,
        			null

			};

			if(AsistenciasSal_all_ENT.size()==0) {
				AsistenciasSal_all_ENT.add(nulo);
//				System.out.println("NULO ASISTENCIAS_ALL ENT: "+listaPorPersonAsis_All.size());
			}
			if(AsistenciasSal_all_SAL.size()==0) {
				AsistenciasSal_all_SAL.add(nulo);
//				System.out.println("NULO ASISTENCIAS_ALL SAL: "+listaPorPersonAsis_All.size());
			}
			
			//System.out.println("ASIS_ ALL : ENT ("+AsistenciasSal_all_ENT.size()+") | SAL ("+AsistenciasSal_all_SAL.size()+") "+persona_id[0]);


			
			ArrayList<movimientoMarcaje> listaPorPersonaMrk	= this.extraerMarcajes(movimientosMarcajes, idP_aux,fechaDia);
			int rmk_tiempo_asistencia = 0;
			int rmk_tiempo_asistencia_SinReceso= 0;
			int rmk_tiempo_ausencias = 0;

			
			horarios h = new horarios();

			int idHorarioPersona = 0;
			String diaNombreAux = "";
			if(nombreDia.equalsIgnoreCase("lunes")) {
				diaNombreAux="1";
			}else if(nombreDia.equalsIgnoreCase("martes")) {
				diaNombreAux="2";
			}else if(nombreDia.equalsIgnoreCase("miercoles")) {
				diaNombreAux="3";
			}else if(nombreDia.equalsIgnoreCase("jueves")) {
				diaNombreAux="4";
			}else if(nombreDia.equalsIgnoreCase("viernes")) {
				diaNombreAux="5";
			}else if(nombreDia.equalsIgnoreCase("sabado")) {
				diaNombreAux="6";
			}else if(nombreDia.equalsIgnoreCase("domingo")) {
				diaNombreAux="7";
			}
			
			int xyz = 1;//0 es el ID DEL PERSONAL EN LE STRING[] QUE CONTIENE LOS HORARIOS
			try {
				idHorarioPersona = Integer.parseInt(diaNombreAux);
				
				xyz = Integer.parseInt(persona_id[idHorarioPersona]);
				
				
				
				
			} catch (Exception e) {
				// .
				System.out.println("NO SE PARSEO EL ID DEL DIA "+nombreDia+" "+fechaDia);
			}
			
//			System.out.println("ID DIA: "+nombreDia+" "+idHorarioPersona+" "+idP_aux+" "+xyz);
			horarios horahorarioDia = h.buscarHorario(dias,xyz);
			String hInicio = fechaDia+" "+horahorarioDia.getHor_hora_inicio();
			String hFin= fechaDia+" "+horahorarioDia.getHor_hora_final();
			
			try {
				
				Date hInicio_date = dteFormat.parse(hInicio+":00");
				Date hFin_date = dteFormat.parse(hFin+":00");
				/*
				if(horahorarioDia.getDia_mas_uno().equalsIgnoreCase("s")) {
					
					String[] paux = fechaDia.split("-"); //2018-09-10
					int diaMasUno = Integer.parseInt(paux[2]);
					diaMasUno +=1; 
					fechaDia = paux[0]+"-"+paux[1]+"-"+(diaMasUno);
					hFin = fechaDia+" "+horahorarioDia.getHor_hora_final();
					hFin_date = dteFormat.parse(hFin+":00");
				}*/
				
				int diferencia  = (int) ((hFin_date.getTime()-hInicio_date.getTime())/1000);
				int diasDif = 0;
				int hrsDif = 0;
				int minDif = 0;
				if(diferencia>86400) {
					diasDif = (int) Math.floor(diferencia/86400);
					diferencia = diferencia-(diasDif*86400);
				}
				
				if (diferencia>3600) {
					hrsDif = (int)Math.floor(diferencia/3600);
					diferencia = diferencia-(hrsDif*3600);
				}

				if(diferencia>60) {
					minDif = (int)Math.floor(diferencia/60);
					diferencia = diferencia - (minDif*60);
				}

				
				rmk_tiempo_asistencia = hrsDif;

				if(listaPorPersonaAs.size()==0 && listaPorPersonaMrk.size()==0) {
					// SIN MARCAJES NI ASISTENCIAS -- ¿NO LABORABLE?
//					System.out.println("MRK 0 ASI 0" );

				}else {
					diaLaborable = true;
//					System.out.println("DIA: "+fechaDia+" ID_PERSONAL: "+idP_aux);

//					System.out.println("\n------------------------------------------------");
//					System.out.println("PSL: "+idP_aux+" | F: "+fechaDia+" ("+nombreDia+")| HRR: "+horahorarioDia.getSmn_horarios_id()+" DM1: "+horahorarioDia.getDia_mas_uno());

					
					/* 
					 *A CONTINIACION PREGUNTO SI EL ID DE LA PERSONA NO HA GENERADO ALGUN MARACAJE
					 **/
					
					if(listaPorPersonaMrk.size()==0) {
						//NO GENEREO NI UN MARCAJE UNA PERSONA -NO FUE A TRABAJAR 
						rmk_tiempo_ausencias = rmk_tiempo_asistencia;
//						System.out.println("MRK: 0 | ASI: "+listaPorPersonaAs.size()+" | AUSE "+rmk_tiempo_ausencias+" "+idP_aux);
					
						/*
						 * RECORRER LAS ASISTENCIAS PARA VER CUATNAS FALTO
						 * */
						boolean js = false;
						String[] leidas = AsistenciasSal_all_ENT.get(0);
//						if(leidas[4].equalsIgnoreCase("00:00") || leidas[4].equalsIgnoreCase("NA")) {

						
							
						if(leidas[4]==null || leidas[4]==null) {
							//NO ASISTIO EN LA MAÑANA; NO HAY PORQE GENERAR OTR JUSTIFICACION
							ArrayList<asistencia> AsistenciasEnt_aux = this.cuantosTiposAsistenciaPorPersona(listaPorPersonaAs, "ENT");
							int plaAux = 0;
							if(AsistenciasEnt_aux.size()>0) {
								plaAux=AsistenciasEnt_aux.get(0).getClavePlanAsistencia();
							}
							js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, horahorarioDia.getHor_hora_inicio(), rmk_tiempo_ausencias, persona_id[8], "Retraso Total", "CAUSA",plaAux);
						}else if(leidas[4].equalsIgnoreCase("00:00") || leidas[4].equalsIgnoreCase("NA")) {
							 js = true;

						}
						
						if(js) {
							fineJ++;
							for (int fls = 0; fls < listaPorPersonaAs.size(); fls++) {
								asistencia flsA = listaPorPersonaAs.get(fls);
								boolean flsb = this.updateAsistencia(flsA.getClaveAsistencia(), "00:00", "NA");
								if(!flsb) {
									falses++;
									noUpdate+=" "+flsA.getClaveAsistencia();
								}else {
									fineU++;
								}
							}
						}else {
							falsesJ++;
							noJustifico+=" "+persona_id[0]+" | "+fechaDia;
						}
						
						
						
					}// FIN SIN MARKAJES PERO CON ASISTENCIAS
					else {
						if(listaPorPersonaAs.size()>0) {
							//SI GENEREO MARCAJES,

							String[] leidas1 = AsistenciasSal_all_ENT.get(0);
							if(leidas1[4]==null || leidas1[4]==null) {
								//NO LEIDA
								
							}else {
								if(leidas1[4].equalsIgnoreCase("00:00") || leidas1[4].equalsIgnoreCase("NA")) {
									//NO ASISTIO EN LA MAÑANA; NO HAY PORQE GENERAR OTR JUSTIFICACION
									falto_entradaPrincipal_asi = true;
								}else {
									//SE LE GENERO UN COMPARATICVO EN LA PRIMERA ENTRADA  ---> DE RETRASO
								}

							}

							
							
							//AHORA TOCA VER CUANTOS MARCAJES DEBIA HACER SEGUN EL PLAN DE ASISTENCIAS
							ArrayList<asistencia> AsistenciasEnt = this.cuantosTiposAsistenciaPorPersona(listaPorPersonaAs, "ENT");
							ArrayList<asistencia> AsistenciasSal = this.cuantosTiposAsistenciaPorPersona(listaPorPersonaAs, "SAL");

							ArrayList<movimientoMarcaje> MarcajesEnt = this.cuantosTiposMarcajesPorPersona(listaPorPersonaMrk, "ENT");
							ArrayList<movimientoMarcaje> MarcajesSal = this.cuantosTiposMarcajesPorPersona(listaPorPersonaMrk, "SAL");
							

							ArrayList<asistencia> AsistenciasCom = this.cuantosTiposAsistenciaPorPersona(listaPorPersonaAs, "CO");
							ArrayList<movimientoMarcaje> MarcajesCom = this.cuantosTiposMarcajesPorPersona(listaPorPersonaMrk, "CO");

//							System.out.println("ENT | MRK ("+MarcajesEnt.size()+") | ASI ("+AsistenciasEnt.size()+")");
//							System.out.println("SAL | MRK ("+MarcajesSal.size()+") | ASI ("+AsistenciasSal.size()+")");


							//PARA EL COMEDOR

							if(AsistenciasCom.size()==MarcajesCom.size()) {//SI MARCO LA MISMA CNT DE EL PLAN 
								if(AsistenciasCom.size()==0) {//NO TIENE ASIGNADO NI MARCO EN COMEDOR
								}else {
									for (int jklm = 0; jklm < AsistenciasCom.size(); jklm++) {
										asistencia coAsis = AsistenciasCom.get(jklm);
										movimientoMarcaje coMrk = MarcajesCom.get(jklm);
										int difeEn = this.obtenerDiferencia_mrkVsAsi((coAsis.getFechaEvento()+" "+coAsis.getHoraTopeEvento()+":00"), (coMrk.getMarcajeFecha()+":00"));
										if(difeEn>0) {//TARDE

											
											if(coAsis.getEstatusPermiso().equalsIgnoreCase("AP")) {
									
											}else {
												boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, coMrk.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada Comedor", "CAUSA",coAsis.getClavePlanAsistencia());
												if(!js) {
													noJustifico+=" "+persona_id[0]+" | "+fechaDia;
													falsesJ++;
												}else {
													fineJ++;
												}

												
											}
											
											
											boolean flsb = this.updateAsistencia(coAsis.getClaveAsistencia(), coMrk.getMarcajeHora(), "");
											if(!flsb) {
												falses++;
												noUpdate+=" "+coAsis.getClaveAsistencia();
											}else {
												fineU++;
											}


											
										}else if(difeEn<=0) {
											//LLEGO TEMPRANO
											// NO PASA NADA
											
										}
//(int smn_asistencia_id,int smn_mov_marcaje_id,int smn_control_esquema_rotacion_id,int smn_personal_id,String asc_fecha_generada,String asc_hora_generada, String mrk_marcaje_hora) {
										boolean xCm = this.insertarAsistenciaComedor(coAsis.getClaveAsistencia(),coMrk.getIdMovMarcaje(),0,persona_id[0],coAsis.getFechaEvento(),coAsis.getHoraTopeEvento(),coMrk.getMarcajeHora());
										if(xCm) {
											fineCom++;
										}else {
											noComedor+="(MRK:"+coMrk.getIdMovMarcaje()+" ASI:"+coAsis.getClaveAsistencia()+")-";
											falseCom++;
										}
										
										
									}
									
								}
								
							}else if(AsistenciasCom.size()>MarcajesCom.size()) {// SI MARCO MENOS
								int ultimoMrkC = MarcajesCom.size();
								if(ultimoMrkC>0) {
									for (int jklm = 0; jklm < MarcajesCom.size(); jklm++) {
										asistencia coAsis = AsistenciasCom.get(jklm);
										movimientoMarcaje comMrk = MarcajesCom.get(jklm);
										int difeEn = this.obtenerDiferencia_mrkVsAsi((coAsis.getFechaEvento()+" "+coAsis.getHoraTopeEvento()+":00"), (comMrk.getMarcajeFecha()+":00"));
										if(difeEn>0) {//TARDE
											String hm_difE = this.horasMin_restantes(difeEn);
//											System.out.println("ENTRADA F : "+hm_difE);
											//GENERARA JUSTIFICACION
	
											if(coAsis.getEstatusPermiso().equalsIgnoreCase("AP")) {
											}else {
												boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, comMrk.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada Comedor", "CAUSA",coAsis.getClavePlanAsistencia());
												if(!js) {
													noJustifico+=" "+persona_id[0]+" | "+fechaDia;
													falsesJ++;
												}else {
													fineJ++;
												}
												
											}

											
											boolean flsb = this.updateAsistencia(coAsis.getClaveAsistencia(), comMrk.getMarcajeHora(), "A");
											if(!flsb) {
												falses++;
												noUpdate+=" "+coAsis.getClaveAsistencia();
											}else {
												fineU++;
											}

											
										}else if(difeEn<=0) {
											int abs = difeEn*(-1);
											//LLEGO TEMPRANO
											// NO PASA NADA
										}
										boolean xCm = this.insertarAsistenciaComedor(coAsis.getClaveAsistencia(),comMrk.getIdMovMarcaje(),0,persona_id[0],coAsis.getFechaEvento(),coAsis.getHoraTopeEvento(),comMrk.getMarcajeHora());
										if(xCm) {
											fineCom++;
										}else {
											noComedor+="(MRK:"+comMrk.getIdMovMarcaje()+" ASI:"+coAsis.getClaveAsistencia()+")-";
											falseCom++;

										}

										
									}//FOR
								}//IF

								/*
								 * EL SEGUNDO FOR ES PARA GENERAR LAS <<ASISTENCIAS COMEDOR>> POR LAS ASISTENCIA NO MARCADAS
								 * */
								for (int ultAsisC = ultimoMrkC; ultAsisC < AsistenciasCom.size(); ultAsisC++) {
									//JUSTIFICAR ASSITENCIAS NO MARCADAS- AUSENCIA | ENT
									asistencia auxx = AsistenciasCom.get(ultAsisC);
									int idMrkAux = 0;
									boolean xCm = this.insertarAsistenciaComedor(auxx.getClaveAsistencia(),idMrkAux,0,persona_id[0],auxx.getFechaEvento(),auxx.getHoraTopeEvento(),"00:00");
									if(xCm) {
										fineCom++;
									}else {
										noComedor+="(MRK:0 ASI:"+auxx.getClaveAsistencia()+")-";
										falseCom++;

									}


								}
								
								
							}else if(AsistenciasCom.size()<MarcajesCom.size()){//  SI MARCO MAS
								
								int ultimoAsisCom = AsistenciasCom.size();
								if(ultimoAsisCom>0) {
									for (int jklm = 0; jklm < AsistenciasCom.size(); jklm++) {
										asistencia comAsis = AsistenciasCom.get(jklm);
										movimientoMarcaje comMrk = MarcajesCom.get(jklm);

										int difeEn = this.obtenerDiferencia_mrkVsAsi((comAsis.getFechaEvento()+" "+comAsis.getHoraTopeEvento()+":00"), (comMrk.getMarcajeFecha()+":00"));
										if(difeEn>0) {//TARDE

											if(comAsis.getEstatusPermiso().equalsIgnoreCase("AP")) {
											}else {
												boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, comMrk.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada Comedor", "CAUSA",comAsis.getClavePlanAsistencia());
												if(!js) {
													noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+comMrk.getMarcajeHora();
													falsesJ++;
												}else {
													fineJ++;
												}										

											}

											
											
											
											boolean flsb = this.updateAsistencia(comAsis.getClaveAsistencia(), comMrk.getMarcajeHora(), "A");
											if(!flsb) {
												falses++;
												noUpdate+=" "+comAsis.getClaveAsistencia();
											}else {
												fineU++;
											}

										}else if(difeEn<=0) {
											int abs = difeEn*(-1);

											//LLEGO TEMPRANO
											// NO PASA NADA
										}
										boolean xCm = this.insertarAsistenciaComedor(comAsis.getClaveAsistencia(),comMrk.getIdMovMarcaje(),0,persona_id[0],comAsis.getFechaEvento(),comAsis.getHoraTopeEvento(),comMrk.getMarcajeHora());
										if(xCm) {
											fineCom++;
										}else {
											noComedor+="(MRK:"+comMrk.getIdMovMarcaje()+" ASI:"+comAsis.getClaveAsistencia()+")-";
											falseCom++;

										}

										
									}//FOR									
								}//IF
								
								/*
								 * EL SEGUNDO FOR ES PARA GENERAR LAS <<ASISTENCIAS COMEDOR>> POR LOS MARCJAES NO PLANIFICADOS
								 * */
								for (int ultimoMrkCom = ultimoAsisCom; ultimoMrkCom < MarcajesEnt.size(); ultimoMrkCom++) {
									//JUSTIFICAR ASSITENCIAS NO PLANIFICADAS
									movimientoMarcaje auxx = MarcajesCom.get(ultimoMrkCom);
									
									int idAsisAux = 0;
									String fmrk ="2000-01-30";
									try {
										
										String[] fpts = auxx.getMarcajeFecha().split(" ");
										fmrk = fpts[0];
										
									} catch (Exception e) {
										// TODO: handle exception
										logger.error("ERROR EN FECHA: "+e);
									}

									boolean xCm = this.insertarAsistenciaComedor(idAsisAux,auxx.getIdMovMarcaje(),0,persona_id[0],fmrk,"00:00",auxx.getMarcajeHora());
									if(xCm) {
										fineCom++;
									}else {
										noComedor+="(MRK:"+auxx.getIdMovMarcaje()+" ASI:0)-";
										falseCom++;

									}

								}
								
								
								

							}
							//FIN DE VALIDACION COMEDOR
							////////////////////////////////////
							////////////////////////////////////
							////////////////////////////////////
								
								
							
							if(AsistenciasEnt.size()==MarcajesEnt.size()) {//SI MARCO LA MISMA CNT DE EL PLAN
								//EN TEORIA DEBERIAN SER 2
	//							System.out.println("ENT |  MRK = ASI");
								for (int jklm = 0; jklm < AsistenciasEnt.size(); jklm++) {
									asistencia entAsis = AsistenciasEnt.get(jklm);
									movimientoMarcaje entMrk = MarcajesEnt.get(jklm);
//									System.out.println(entAsis.getHoraTopeEvento()+" "+entMrk.getMarcajeHora());
									int difeEn = this.obtenerDiferencia_mrkVsAsi((entAsis.getFechaEvento()+" "+entAsis.getHoraTopeEvento()+":00"), (entMrk.getMarcajeFecha()+":00"));
									if(difeEn>0) {//TARDE
										String hm_difE = this.horasMin_restantes(difeEn);
//										System.out.println("ENTRADA F : "+hm_difE);
										//GENERARA JUSTIFICACION
										

										if(entAsis.getEstatusPermiso().equalsIgnoreCase("AP")) {
										}else {
											boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, entMrk.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada", "CAUSA",entAsis.getClavePlanAsistencia());
											if(!js) {
												noJustifico+=" "+persona_id[0]+" | "+fechaDia;
												falsesJ++;
											}else {
												fineJ++;
											}

										}
										boolean flsb = this.updateAsistencia(entAsis.getClaveAsistencia(), entMrk.getMarcajeHora(), "A");
										if(!flsb) {
											falses++;
											noUpdate+=" "+entAsis.getClaveAsistencia();
										}else {
											fineU++;
										}
										
										
									}else if(difeEn<=0) {
										//LLEGO TEMPRANO
										// NO PASA NADA
										
									}
									
								}
							}else if(AsistenciasEnt.size()>MarcajesEnt.size()) {// SI MARCO MENOS
		//						System.out.println("ENT | MRK < ASI | ");
								int ultimoMrk = MarcajesEnt.size();
								if(ultimoMrk>0) {
									for (int jklm = 0; jklm < MarcajesEnt.size(); jklm++) {
										asistencia entAsis = AsistenciasEnt.get(jklm);
										movimientoMarcaje entMrk = MarcajesEnt.get(jklm);
										int difeEn = this.obtenerDiferencia_mrkVsAsi((entAsis.getFechaEvento()+" "+entAsis.getHoraTopeEvento()+":00"), (entMrk.getMarcajeFecha()+":00"));
										if(difeEn>0) {//TARDE
											String hm_difE = this.horasMin_restantes(difeEn);
//											System.out.println("ENTRADA F : "+hm_difE);
											//GENERARA JUSTIFICACION
											if(entAsis.getEstatusPermiso().equalsIgnoreCase("AP")) {
											}else {

												boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, entMrk.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada", "CAUSA",entAsis.getClavePlanAsistencia());
												if(!js) {
													noJustifico+=" "+persona_id[0]+" | "+fechaDia;
													falsesJ++;
												}else {
													fineJ++;
												}
											}
											boolean flsb = this.updateAsistencia(entAsis.getClaveAsistencia(), entMrk.getMarcajeHora(), "A");
											if(!flsb) {
												falses++;
												noUpdate+=" "+entAsis.getClaveAsistencia();
											}else {
												fineU++;
											}

											
										}else if(difeEn<=0) {
											int abs = difeEn*(-1);
											boolean flsb = this.updateAsistencia(entAsis.getClaveAsistencia(), entMrk.getMarcajeHora(), "A");
											if(!flsb) {
												falses++;
												noUpdate+=" "+entAsis.getClaveAsistencia();
											}else {
												fineU++;
											}

											//LLEGO TEMPRANO
											// NO PASA NADA
										}
									}									
								}

								/*
								 * EL SEGUNDO FOR ES PARA GENERAR LAS JUSTIFICACIONES POR LAS ASISTENCIA NO MARCADAS
								 * */
								for (int ultAsis = ultimoMrk; ultAsis < AsistenciasEnt.size(); ultAsis++) {
									//JUSTIFICAR ASSITENCIAS NO MARCADAS- AUSENCIA | ENT
									asistencia auxx = AsistenciasEnt.get(ultAsis);
									int difeEn = rmk_tiempo_asistencia;
									boolean js = false;
									if(falto_entradaPrincipal_asi) {
										js = true;
										
									}else {
										if(auxx.getEstatusPermiso().equalsIgnoreCase("AP")) {
										}else {
											js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, auxx.getHoraTopeEvento(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada", "CAUSA",auxx.getClavePlanAsistencia());

											if(!js) {
												noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+auxx.getHoraTopeEvento();
												falsesJ++;
											}else {
												if(falto_entradaPrincipal_asi) {
												}else {
													fineJ++;
												}
											}
											
										}


									}
									boolean flsb = this.updateAsistencia(auxx.getClaveAsistencia(), "00:00", "NA");

									if(!flsb) {
										falses++;
										noUpdate+=" "+auxx.getClaveAsistencia();
									}else {
										fineU++;
									}
									

								}
								
							}else if(AsistenciasEnt.size()<MarcajesEnt.size()){// ESTO NO CREO QUE SUCEDA 
	//							System.out.println("ENT |  MRK > ASI | ASI NO PLAN");
								//QUE TENGA MAS MARCAJES QUE ASISTENCIAS 
								int ultimoAsis = AsistenciasEnt.size();
								if(ultimoAsis>0) {
									for (int jklm = 0; jklm < AsistenciasEnt.size(); jklm++) {
										asistencia entAsis = AsistenciasEnt.get(jklm);
										movimientoMarcaje entMrk = MarcajesEnt.get(jklm);
										int difeEn = this.obtenerDiferencia_mrkVsAsi((entAsis.getFechaEvento()+" "+entAsis.getHoraTopeEvento()+":00"), (entMrk.getMarcajeFecha()+":00"));
										if(difeEn>0) {//TARDE
											String hm_difE = this.horasMin_restantes(difeEn);
//											System.out.println("ENTRADA F : "+hm_difE);
											//GENERARA JUSTIFICACION
											if(entAsis.getEstatusPermiso().equalsIgnoreCase("AP")) {
											}else {
												boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, entMrk.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Entrada", "CAUSA",entAsis.getClavePlanAsistencia());
												if(!js) {
													noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+entMrk.getMarcajeHora();
													falsesJ++;
												}else {
													fineJ++;
												}										
											
											}
											
											boolean flsb = this.updateAsistencia(entAsis.getClaveAsistencia(), entMrk.getMarcajeHora(), "A");
											if(!flsb) {
												falses++;
												noUpdate+=" "+entAsis.getClaveAsistencia();
											}else {
												fineU++;
											}

										}else if(difeEn<=0) {
											int abs = difeEn*(-1);
											boolean flsb = this.updateAsistencia(entAsis.getClaveAsistencia(), entMrk.getMarcajeHora(), "A");
											if(!flsb) {
												falses++;
												noUpdate+=" "+entAsis.getClaveAsistencia();
											}else {
												fineU++;
											}

											//LLEGO TEMPRANO
											// NO PASA NADA
										}
									}									
								}

								
								/*
								 * EL SEGUNDO FOR ES PARA GENERAR LAS JUSTIFICACIONES POR LOS MARCJAES NO PLANIFICADOS
								 * */
								for (int ultimoMrk = ultimoAsis; ultimoMrk < MarcajesEnt.size(); ultimoMrk++) {
									//JUSTIFICAR ASSITENCIAS NO PLANIFICADAS
									movimientoMarcaje auxx = MarcajesEnt.get(ultimoMrk);
									int difeEn = rmk_tiempo_asistencia;
									boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, auxx.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Asistencia no planificada", "CAUSA",0);
									if(!js) {
										noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+auxx.getMarcajeHora();
										falsesJ++;
									}else {
										fineJ++;
									}	
								}

								
							}
							
							
							if(AsistenciasSal.size()==MarcajesSal.size()) {//SI MARCO LA MISMA CNT DE EL PLAN
								//EN TEORIA DEBERIAN SER 2
	//							System.out.println("SAL |  MRK = ASI");

								for (int jklm = 0; jklm < AsistenciasSal.size(); jklm++) {
									asistencia salAsis = AsistenciasSal.get(jklm);
									movimientoMarcaje salMrk = MarcajesSal.get(jklm);
//									System.out.println(entAsis.getHoraTopeEvento()+" "+entMrk.getMarcajeHora());
									int difeSal = this.obtenerDiferencia_mrkVsAsi((salAsis.getFechaEvento()+" "+salAsis.getHoraTopeEvento()+":00"), (salMrk.getMarcajeFecha()+":00"));
									if(difeSal>0) {//SALIO MAS TARDE 
										//JUSTIFICAR TIEMPO ADICIONAL
										String hm_difS = this.horasMin_restantes(difeSal);
										boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, salMrk.getMarcajeHora(), this.calcularDif_DP(difeSal), persona_id[8], "Tiempo adicional", "CAUSA",salAsis.getClavePlanAsistencia());
										if(!js) {
											noJustifico+=" "+persona_id[0]+" | "+fechaDia;
											falsesJ++;
										}else {
											fineJ++;
										}

										
									}else if(difeSal<=0) { 
										//SALIO TEMPRANO 
										//GENERARA JUSTIFICACION SALIO ANTES
										String hm_difS = this.horasMin_restantes(difeSal);
										int abs = difeSal*(-1);
										boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, salMrk.getMarcajeHora(), this.calcularDif_DP(abs), persona_id[8], "Retraso Salida", "CAUSA",salAsis.getClavePlanAsistencia());
										if(!js) {
											noJustifico+=" "+persona_id[0]+" | "+fechaDia;
											falsesJ++;
										}else {
											fineJ++;
										}
										
									}
									boolean flsb = this.updateAsistencia(salAsis.getClaveAsistencia(), salMrk.getMarcajeHora(), "A");
									if(!flsb) {
										falses++;
										noUpdate+=" "+salAsis.getClaveAsistencia();
									}else {
										fineU++;
									}
									
								}
							
							}else if(AsistenciasSal.size() > MarcajesSal.size()) {// SI MARCO MENOS
//								System.out.println("SAL | MRK < ASI | ");
								int ultimoMrk = MarcajesSal.size();
								
								if(ultimoMrk>0) {
									for (int jklm = 0; jklm < MarcajesSal.size(); jklm++) {
										asistencia salAsis = AsistenciasSal.get(jklm);
										movimientoMarcaje salMrk = MarcajesSal.get(jklm);
										int difeSal = this.obtenerDiferencia_mrkVsAsi((salAsis.getFechaEvento()+" "+salAsis.getHoraTopeEvento()+":00"), (salMrk.getMarcajeFecha()+":00"));
										if(difeSal>0) {//SALIO TARDE
											//JUSTIFICAR TIEMPO ADICIONAL
//											System.out.println("ENTRADA F : "+hm_difE);
											String hm_difS = this.horasMin_restantes(difeSal);
											boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, salMrk.getMarcajeHora(), this.calcularDif_DP(difeSal), persona_id[8], "Tiempo adicional", "CAUSA",salAsis.getClavePlanAsistencia());
											if(!js) {
												noJustifico+=" "+persona_id[0]+" | "+fechaDia;
												falsesJ++;
											}else {
												fineJ++;
											}
										}else if(difeSal<=0) {
											//SALIO TEMPRANO 
											//GENERARA JUSTIFICACION SALIO ANTES
											String hm_difS = this.horasMin_restantes(difeSal);
											int abs = difeSal*(-1);
											boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, salMrk.getMarcajeHora(), this.calcularDif_DP(abs), persona_id[8], "Retraso Salida", "CAUSA",salAsis.getClavePlanAsistencia());
											if(!js) {
												noJustifico+=" "+persona_id[0]+" | "+fechaDia;
												falsesJ++;
											}else {
												fineJ++;
											}
										}
										boolean flsb = this.updateAsistencia(salAsis.getClaveAsistencia(), salMrk.getMarcajeHora(), "A");
										if(!flsb) {
											falses++;
											noUpdate+=" "+salAsis.getClaveAsistencia();
										}else {
											fineU++;
										}
									}
								}

								
								/*
								 * EL SEGUNDO FOR ES PARA GENERAR LAS JUSTIFICACIONES POR LAS ASISTENCIA NO MARCADAS | SALIDAS
								 * */
								for (int ultAsis = ultimoMrk; ultAsis < AsistenciasSal.size(); ultAsis++) {
									//JUSTIFICAR ASSITENCIAS NO MARCADAS- AUSENCIA | SALIDA
									asistencia auxx = AsistenciasSal.get(ultAsis);
									int difeEn = rmk_tiempo_asistencia;

									
									boolean js = false;
									if(falto_entradaPrincipal_asi) {
										js = true;
										
									}else {
										js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, auxx.getHoraTopeEvento(), this.calcularDif_DP(difeEn), persona_id[8], "Retraso Salida", "CAUSA",auxx.getClavePlanAsistencia());
									}									
									
									
									
									boolean flsb = this.updateAsistencia(auxx.getClaveAsistencia(), "00:00", "NA");
									if(!flsb) {
										falses++;
										noUpdate+=" "+auxx.getClaveAsistencia();
									}else {
										fineU++;
									}
									if(!js) {
										noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+auxx.getHoraTopeEvento();
										falsesJ++;
									}else {
										if(falto_entradaPrincipal_asi) {
										}else {
											fineJ++;
										}
									}
								}

							}else if(AsistenciasSal.size()<MarcajesSal.size()){// ESTO NO CREO QUE SUCEDA 
								//QUE TENGA MAS MARCAJES QUE ASISTENCIAS | SALIDA
//								System.out.println("SAL |  MRK > ASI | ASI NO PLAN");
								int ultimoAsis = AsistenciasSal.size();
								if(ultimoAsis>0) {
									for (int jklm = 0; jklm < AsistenciasSal.size(); jklm++) {
										asistencia salAsis = AsistenciasSal.get(jklm);
										movimientoMarcaje salMrk = MarcajesEnt.get(jklm);
										int difeSa = this.obtenerDiferencia_mrkVsAsi((salAsis.getFechaEvento()+" "+salAsis.getHoraTopeEvento()+":00"), (salMrk.getMarcajeFecha()+":00"));
										if(difeSa>0) {//SALIO TARDE
											//JUSTIFICAR TIEMPO ADICIONAL
//											System.out.println("ENTRADA F : "+hm_difE);
											String hm_difS = this.horasMin_restantes(difeSa);
											boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, salMrk.getMarcajeHora(), this.calcularDif_DP(difeSa), persona_id[8], "Tiempo adicional", "CAUSA",salAsis.getClavePlanAsistencia());
											if(!js) {
												noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+salMrk.getMarcajeHora();
												falsesJ++;
											}else {
												fineJ++;
											}
											
										}else if(difeSa<=0) {
											//SALIO TEMPRANO 
											//GENERARA JUSTIFICACION SALIO ANTES
											String hm_difS = this.horasMin_restantes(difeSa);
											int abs = difeSa*(-1);
											boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, salMrk.getMarcajeHora(), this.calcularDif_DP(abs), persona_id[8], "Retraso Salida", "CAUSA",salAsis.getClavePlanAsistencia());
											if(!js) {
												noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+salMrk.getMarcajeHora();
												falsesJ++;
											}else {
												fineJ++;
											}
										}
										boolean flsb = this.updateAsistencia(salAsis.getClaveAsistencia(), salMrk.getMarcajeHora(), "A");
										if(!flsb) {
											falses++;
											noUpdate+=" "+salAsis.getClaveAsistencia();
										}else {
											fineU++;
										}
										
									}
								}

								
								/*
								 * EL SEGUNDO FOR ES PARA GENERAR LAS JUSTIFICACIONES POR LOS MARCJAES NO PLANIFICADOS
								 * */
								for (int ultimoMrk = ultimoAsis; ultimoMrk < MarcajesSal.size(); ultimoMrk++) {
									//JUSTIFICAR ASSITENCIAS NO PLANIFICADAS | SALIDA
									movimientoMarcaje auxx = MarcajesSal.get(ultimoMrk);
									int difeEn = rmk_tiempo_asistencia;
									boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, auxx.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Asistencia no planificada", "CAUSA",0);
									if(!js) {
										noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+auxx.getMarcajeHora();
										falsesJ++;

									}else {
										fineJ++;
									}
								}
							}
							
							
						}else {
							//QUE TENGA  MARCAJES SIN ASISTENCIAS 
							//DATA BASURA
//							System.out.println("MRK ("+listaPorPersonaMrk.size()+") | ASI ("+listaPorPersonaAs.size()+") "+persona_id[8]);
//							System.out.println(" ASI NO PLAN");
							//JUSTIFICAR ASSITENCIAS NO PLANIFICADAS | SALIDA
							for (int fls = 0; fls < listaPorPersonaMrk.size(); fls++) {
								movimientoMarcaje auxx = listaPorPersonaMrk.get(fls);
								int difeEn = rmk_tiempo_asistencia;
								boolean js = this.insertarJustificacion(persona_id[0], "0", "20", fechaDia, auxx.getMarcajeHora(), this.calcularDif_DP(difeEn), persona_id[8], "Asistencia no planificada", "CAUSA",0);
								if(!js) {
									noJustifico+=" "+persona_id[0]+" | "+fechaDia+" "+auxx.getMarcajeHora();
									falsesJ++;
								}else {
									fineJ++;
								}
							}
							
						}//FIN DE CON MARCAJE Y SIN ASISTENCIA
						
					}// FIN  MARKAJES CON ASISTENCIAS
					/*				
					System.out.println("************************************");
					System.out.println("**JUSTIFICACIONES DEL DIA ("+fechaDia+")");
					System.out.println("	GENERADAS: "+fineJ);
					System.out.println("	NO GENERADAS: "+falsesJ);
					System.out.println("		INFORMACÓN: "+noJustifico);
					System.out.println("	OTROS ERRORES: "+falses);
					System.out.println("		INFORMACÓN: "+noUpdate);
					System.out.println("************************************");
					*/

					
					
				}//DEL IF QUE ESTA CORRECTO
				
				
				

				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				logger.error("Error Con fecha "+ fechaDia+", Horas "+hInicio+" "+hFin);
				logger.error(e);
			}//CATCH
		}//FOR
		if(diaLaborable) {
			logger.info("************************************");
			logger.info("**JUSTIFICACIONES DEL DIA ("+fechaDia+")");
			logger.info("	GENERADAS: "+fineJ);
			
			if(falsesJ>0) {
				logger.info("	NO GENERADAS: "+falsesJ);
				logger.info("		INFORMACÓN: "+noJustifico);
			}
			
			if(falses>0) {
				logger.info("	OTROS ERRORES: "+falses);
				logger.info("		INFORMACÓN: "+noUpdate);
				
			}

			logger.info("	ASISTENCIAS COMEDOR GENERADAS: "+fineCom);
			if(falseCom>0) {
				logger.info("	ASISTENCIAS COMEDOR NO GENERADAS: "+falseCom);
				logger.info("		INFORMACÓN: "+noComedor);
			}
			logger.info("************************************");
			
		}
		
	}//
	
	public int horas_restantes(int dif) {
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
		
		return hrsDif;
		
		
		
	}
	
	public double calcularDif_DP(int dif) {
		double sal = -1;
//		sal = (dif/100);
		
		String s = "";
		int diasDif = 0;
		int hrsDif = 0;
		int minDif = 0;

		if(dif>=86400) {
			diasDif = (int) Math.floor(dif/86400);
			dif = dif-(diasDif*86400);
		}
		
		if (dif>=3600) {
			hrsDif = (int)Math.floor(dif/3600);
			dif = dif-(hrsDif*3600);
		}

		if(dif>=60) {
			minDif = (int)Math.floor(dif/60);
			dif = dif - (minDif*60);
		}
		
//		System.out.println("--"+minDif);

		String retrasoH = ""+hrsDif;
		if(hrsDif==0) {
			retrasoH="0";
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
		
		String retrasoSeg = "";
		if(dif>0 && dif<9){
			retrasoSeg = "0"+dif;
		}else {
			retrasoSeg = ""+dif;

		}
		
		
		s=retrasoH+"."+retrasoM+retrasoSeg;
		
//		System.out.println(s);
		try {
			sal = Double.parseDouble(s);
		} catch (Exception e) {
			System.err.println(e);
		}
		
		return sal;
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
	
	public int obtenerDiferencia(String asi,String mrk) {
		int diferencia = 0;
		SimpleDateFormat dteFormat = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		
		try {
			Date dAsi= dteFormat.parse(asi);
			Date dMrk = dteFormat.parse(mrk);

			int fff = (int) dAsi.getTime();
			int fff2 = (int) dMrk.getTime();
			int d = (fff2-fff)/1000;
			int d2 = (fff-fff2)/1000;
			if(d>d2) {
				diferencia=d;
			}else if(d2>d) {
				diferencia=d2;
			}else {
				diferencia=d;
			}
			
			
			
			} catch (ParseException e) {
			// TODO Auto-generated catch block
				logger.info(mrk);
				logger.error("obtenerDiferencia() "+e);
			}//CATCH
		
		
		return diferencia;
	}
	
	public int obtenerDiferencia_mrkVsAsi(String asi,String mrk) {
		int diferencia = 0;
		SimpleDateFormat dteFormat = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		
		try {
			Date dAsi= dteFormat.parse(asi);
			Date dMrk = dteFormat.parse(mrk);

			int intAsi = (int) dAsi.getTime();
			int intMrk = (int) dMrk.getTime();
			int d = (intMrk-intAsi)/1000; 
			diferencia=d;
			
			
			
			} catch (ParseException e) {
			// TODO Auto-generated catch block
				logger.info("obtenerDiferencia_mrkVsAsi()");
				logger.error(e);
			}//CATCH
		
		
		return diferencia;
	}
	
	public int extraerAsistencias_ALL_pos(ArrayList<String []> asistenciasAll){
		int pos = 0;
		
		
		return 0;
	}
	public ArrayList<String[]> extraerAsistencias_ALL(ArrayList<String []> asistenciasAll,String idPersonal,String fecha){
        ArrayList<String[]> listaPorPersonaAs_ALL = new ArrayList<String[]>();
		String[] obj;

/*    	            			
 						rs.getString("smn_asistencia_id"),
 						rs.getString("asi_personal_rf"),
            			rs.getString("asi_fecha_evento"),
            			rs.getString("asi_tipo_marcaje"),
            			rs.getString("asi_hora_marcaje"),
            			rs.getString("asi_estatus_marcaje")
            			
    			
    	};*/
		
		for (int iall = 0; iall < asistenciasAll.size(); iall++) {
			obj = asistenciasAll.get(iall);
			if(fecha.equalsIgnoreCase(obj[2])) {
				if(obj[1].equalsIgnoreCase(idPersonal)) {
					listaPorPersonaAs_ALL.add(obj);
//					System.out.println(obj[0]+"-"+obj[1]+"-"+obj[2]+"-"+obj[3]+"-"+obj[4]+"-"+obj[5]);
				}
			}
		}
		
		return listaPorPersonaAs_ALL;
	
	}//
	
	
	public ArrayList<asistencia> extraerAsistencias(ArrayList<asistencia> asistencias,int idPersonal,String fecha){
        ArrayList<asistencia> listaPorPersonaAs = new ArrayList<asistencia>();

		asistencia a;

		for (int ia = 0; ia < asistencias.size(); ia++) {
			a = asistencias.get(ia);
			if(fecha.equalsIgnoreCase(a.getFechaEvento())) {
				if(a.getClavePersonal()==idPersonal) {
					listaPorPersonaAs.add(a);
				}
			}
		}
		
		return listaPorPersonaAs;
	
	}//
	public ArrayList<movimientoMarcaje> extraerMarcajes(ArrayList<movimientoMarcaje> marcajes,int idPersonal,String fecha){
        ArrayList<movimientoMarcaje> listaPorPersonaMrk = new ArrayList<movimientoMarcaje>();
        movimientoMarcaje mrk;
        if(marcajes.size()>0) {
            for (int imk = 0; imk < marcajes.size(); imk++) {
    			mrk = marcajes.get(imk);
    			String[] partesF = mrk.getMarcajeFecha().split(" ");
    			if(partesF[0].equalsIgnoreCase(fecha)) {
    				if(mrk.getPersonal().equalsIgnoreCase(String.valueOf(idPersonal))) {
//    					System.out.println(idPersonal+" "+mrk.getPersonal());
    					listaPorPersonaMrk.add(mrk);
    				}
    				
    			}
    		}
        	
        }
		return listaPorPersonaMrk;
	
	}//
	
	public ArrayList<movimientoMarcaje> cuantosTiposMarcajesPorPersona(ArrayList<movimientoMarcaje> marcajesPorPersona, String tipo){
        ArrayList<movimientoMarcaje> tiposMarcajesPersona = new ArrayList<movimientoMarcaje>();
        movimientoMarcaje mrk;
        if(marcajesPorPersona.size()>0) {
        	
    		for (int imk = 0; imk < marcajesPorPersona.size(); imk++) {
    			mrk = marcajesPorPersona.get(imk);
    			if(mrk.getTipoMarcaje().equalsIgnoreCase(tipo)) {
    				tiposMarcajesPersona.add(mrk);
    			}
    		}        
    	}

		
        
        
        return tiposMarcajesPersona;
	}

	public ArrayList<String[]> cuantosTiposAsistenciaPorPersonaAll(ArrayList<String []> asistenciaPorPersona_All, String tipo){
        ArrayList<String[]> tiposAsistenciasPersona_all = new ArrayList<String[]>();
        String [] asi;
        if(asistenciaPorPersona_All.size()>0) {
    		for (int imk = 0; imk < asistenciaPorPersona_All.size(); imk++) {
    			asi = asistenciaPorPersona_All.get(imk);
    			if(asi[3].equalsIgnoreCase(tipo)) {
    				tiposAsistenciasPersona_all.add(asi);
    			}
    		}
        	
        }
		
        
        
        return tiposAsistenciasPersona_all;
	}

	
	public ArrayList<asistencia> cuantosTiposAsistenciaPorPersona(ArrayList<asistencia> asistenciaPorPersona, String tipo){
        ArrayList<asistencia> tiposAsistenciasPersona = new ArrayList<asistencia>();
        asistencia mrk;
        if(asistenciaPorPersona.size()>0) {
    		for (int imk = 0; imk < asistenciaPorPersona.size(); imk++) {
    			mrk = asistenciaPorPersona.get(imk);
    			if(mrk.getTipoMarcaje().equalsIgnoreCase(tipo)) {
    				tiposAsistenciasPersona.add(mrk);
    			}
    		}
        	
        }
		
        
        
        return tiposAsistenciasPersona;
	}
	
	public boolean insertarResumen(String idPersonal,String entidad,String sucursal,String eo,String cc,String mrkFecha, String tmAsis,String tmRts,String tmAus,String tmDesc,String tmExt,String tmPrm) {
		boolean rst = false;
        String horaActual = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
        String fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			

        String s = "INSERT INTO smn_control_acceso.smn_resumen_marcajes( " + 
        		"            smn_resumen_marcajes_id, "
        		+ "			 smn_personal_rf,"
        		+ "			 smn_entidad_rf, "
        		+ "			 smn_sucursal_rf, " + 
        		
        		"            smn_estructura_organizacional_rf, "
        		+ "			 smn_centro_costo_rf,"
        		+ "			 mrk_fecha, " + 

        		"            rmk_tiempo_asistencia,"
        		+ "			 rmk_tiempo_retrasos,"
        		+ "			 rmk_tiempo_ausencias, " + 

        		"            rmk_tiempo_descanso,"
        		+ "			 rmk_tiempo_extras,"
        		+ "			 rmk_tiempo_permisos, " + 
        		
        		"            rmk_estatus,"
        		+ "			 rmk_idioma,"
        		+ "			 rmk_usuario,"
        		+ "			 rmk_fecha_registro,"
        		+ "			 rmk_hora) " + 
        		"    VALUES (	nextval('smn_control_acceso.seq_smn_resumen_marcajes'), "
        						+idPersonal+", "
        		+ 				entidad+", "
        		+ 				sucursal+", " + 

								eo+","
								+cc+","
								+ "'"+mrkFecha+"', " + 
        		
        		"            	'"+tmAsis+"', "+
        		"            	'"+tmRts+"', "+
        		"            	'"+tmAus+"', "+
        		
        		"            	'"+tmDesc+"', "+
        		"            	'"+tmExt+"', "+
        		"            	'"+tmPrm+"', "+
        		
                "				'GE', " + 
                "				'es', "+
                "				'admin', "+
                "				'"+fechaActual+"', "+
                "				'"+horaActual+"');";		

				int n;
				try {
					n = this.getCnPostgre().createStatement().executeUpdate(s);
					if (n > 0) {
						rst = true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.info("ERROR INSERT RESUMEN");
					logger.error(e);
				}
		return rst;
	}

	public boolean insertarJustificacion(String idPersonal,String tipoActividad,String docRf,String fechaIncidencia,String horaIncidencia,double timeJust,String jefe, String descripcion, String causa,int planA) {
		boolean rst = false;
        String horaActual = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
        String fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			

        String s1 = "INSERT INTO smn_control_acceso.smn_justificaciones( "+ 
        		"            smn_justificaciones_id, "
        		+ "			 smn_personal_id, "
        		+ "			 jus_tipo_actividad_rf, " + 
        		
        		
        		"            jus_documento_rf, "
        		+ "			 jus_fecha_incidencia, "
        		+ "			 jus_hora_incidencia, " + 
        		
        		"            jus_tiempo_a_justificar, "
        		+ "			 jus_estatus_rf, "
        		+ "			 jus_jefe_inmediato_rf, " + 
        		
        		"            jus_descripcion, "
        		+ "			 jus_causa, "

        		+ "			 jus_idioma, "
        		+ "			 jus_usuario, "
        		+ "			 jus_fecha_registro, " + 
        		"            jus_hora, smn_plan_asistencia_id) " + 

        		"    VALUES (nextval('smn_control_acceso.seq_smn_justificaciones'), "+
        					 idPersonal+", "+
        					 tipoActividad+", "+
        					 
        					 docRf+", "+
        					 "'"+fechaIncidencia+"', "+
        					 "'"+horaIncidencia+"', "+
        					 
        					 timeJust+", "+
        					 "'GE', "+
        					 jefe+", "+
        		
        					 "'', "+      					 
        					 "'', "+      					 
                "				'es', "+
                "				'admin', "+
                "				'"+fechaActual+"', "+
                "				'"+horaActual+"', "
                				+planA+ ");";
//			System.out.println(s1);
			int n = -1;
				try {
					n = this.getCnPostgre().createStatement().executeUpdate(s1);
					if (n > 0) {
						
						String s2 = "";
						rst = true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.info("ERROR INSERT JUSTIFICACIONES");
					logger.error(e);
				}
		return rst;
	}

	public boolean updateAsistencia(int idAsistencia,String horaMrk,String estatusMrk) {
		boolean rst = false;
        String s1 = "UPDATE smn_control_acceso.smn_asistencia " + 
        		"   SET asi_hora_marcaje='"+horaMrk+"', " + 
        		"       asi_estatus_marcaje='"+estatusMrk+"' " + 
        		" WHERE smn_asistencia_id="+idAsistencia+";";
        
//			System.out.println(s1);
			int n = -1;
				try {
					n = this.getCnPostgre().createStatement().executeUpdate(s1);
					if (n > 0) {
						rst = true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.info("ERROR UPDATE ASISTENCIA");
					logger.error(e);
				}
		return rst;
	}
	
	

	public boolean insertarAsistenciaComedor(int smn_asistencia_id,int smn_mov_marcaje_id,int smn_control_esquema_rotacion_id,String smn_personal_id,String asc_fecha_generada,String asc_hora_generada, String mrk_marcaje_hora) {
		boolean rst = false;
        String horaActual = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
        String fechaActual = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());     			


        /*
         * 
         *  
         	INSERT INTO smn_control_acceso.smn_asistencia_comedor(

		        smn_asistencia_comedor_id, 
		        smn_asistencia_id, 
		        smn_mov_marcaje_id, 
		        
		        smn_control_esquema_rotacion_id, 
		        smn_personal_id, 
		        asc_fecha_generada, 
		        
		        asc_hora_generada, 
		        mrk_marcaje_hora, 
		        com_estatus, 
		
		        asc_idioma, 
		        asc_usuario, 
		        asc_fecha_registro, 
		        asc_hora)
            
    		VALUES (
			    nextval('smn_control_acceso.seq_smn_justificaciones'),
			    1,
			    2,
		    
	            0, 
	            14, 
	            '2019-08-30', 
	            
	            '04:30', 
	            '05:30', 
	            'PR', 
	
	            'es', 
	            'admin', 
	            '2019-08-30', 
	            '08:24:01');
	            
         * */
        String sC="INSERT INTO smn_control_acceso.smn_asistencia_comedor(" + 

        		"		        smn_asistencia_comedor_id, " + 
        		"		        smn_asistencia_id, " + 
        		"		        smn_mov_marcaje_id, " + 

        		"		        smn_control_esquema_rotacion_id, " + 
        		"		        smn_personal_id, " + 
        		"		        asc_fecha_generada, " + 

        		"		        asc_hora_generada, " + 
        		"		        mrk_marcaje_hora, " + 
        		"		        com_estatus, " + 

        		"		        asc_idioma, " + 
        		"		        asc_usuario, " + 
        		"		        asc_fecha_registro, " + 
        		"		        asc_hora)"+

        		
        		"    VALUES ("+ 
        		"        		 nextval('smn_control_acceso.seq_smn_justificaciones'), " + 
        		" 			    "+smn_asistencia_id+", " + //smn_asistencia_id
        		" 			    "+smn_mov_marcaje_id+", " + //smn_mov_marcaje_id

        		" 	            "+smn_control_esquema_rotacion_id+", " + //smn_control_esquema_rotacion_id
        		" 	            "+smn_personal_id+", " + //smn_personal_id
        		" 	            '"+asc_fecha_generada+"', " + //asc_fecha_generada

        		" 	            '"+asc_hora_generada+"', " + //asc_hora_generada
        		" 	            '"+mrk_marcaje_hora+"', " + //mrk_marcaje_hora
        		" 	            'PR', " + //com_estatus
        		
        		"				'es', "+
                "				'admin', "+
                "				'"+fechaActual+"', "+
                "				'"+horaActual+"');";	
//			System.out.println(s1);

        
        	int n = -1;
				try {
					n = this.getCnPostgre().createStatement().executeUpdate(sC);
					if (n > 0) {
						
						String s2 = "";
						rst = true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.info("ERROR INSERT JUSTIFICACIONES");
					logger.error(e);
				}
		return rst;
	}
	
	
	
}
/** QUERY DE PERSONAL
	select * from smn_control_acceso.smn_personal 
	--inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_personal.psl_estructura_organizacional_rf 
	--inner join smn_base.smn_rel_entidad_estructura on (INNER JOIN )
	
	inner join( smn_base.smn_estructura_organizacional 
	   inner join (smn_base.smn_configuracion_estructura 
		 inner join ( smn_base.smn_rel_entidad_estructura 
			inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_base.smn_rel_entidad_estructura.smn_entidades_id
		 ) on smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id = smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id
	--	inner join smn_base.smn_rel_entidad_estructura on smn_base.smn_rel_entidad_estructura.smn_configuracion_estructura_id = smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id
	   ) on smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id = smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id
	--   inner join smn_base.smn_configuracion_estructura on smn_base.smn_configuracion_estructura.smn_configuracion_estructura_id = smn_base.smn_estructura_organizacional.smn_configuracion_estructura_id
	) on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_personal.psl_estructura_organizacional_rf 
	--group by smn_personal
	--where smn_personal.smn_personal_id =140
	


*/