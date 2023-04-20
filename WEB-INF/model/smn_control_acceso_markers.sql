DROP TABLE smn_control_acceso.smn_lista_control;
DROP TABLE smn_control_acceso.smn_transacciones_desnorm;
DROP TABLE smn_control_acceso.smn_transacciones_manuales;
DROP TABLE smn_control_acceso.smn_resumen_marcajes;
DROP TABLE smn_control_acceso.smn_dispositivos;
DROP TABLE smn_control_acceso.smn_movimiento_marcajes;
DROP TABLE smn_control_acceso.smn_justificaciones;
DROP TABLE smn_control_acceso.smn_solicitud_permisos;
DROP TABLE smn_control_acceso.smn_personal;
DROP TABLE smn_control_acceso.smn_rotacion_turnos;
DROP TABLE smn_control_acceso.smn_turnos;
DROP TABLE smn_control_acceso.smn_transacciones;

CREATE TABLE smn_control_acceso.smn_transacciones(
  smn_transacciones_id INTEGER NOT NULL,
  trn_sede VARCHAR(48) NOT NULL,
  trn_dispositivo VARCHAR(16) NOT NULL,
  trn_identificacion VARCHAR(16) NOT NULL,
  trn_marcaje VARCHAR(16) NOT NULL,
  trn_tipo_marcaje CHARACTER(3) NOT NULL,
  trn_fecha_transaccion TIMESTAMP NOT NULL,
  trn_hora_transaccion CHARACTER(5) NOT NULL,
  trn_idioma CHARACTER(2) NOT NULL,
  trn_usuario VARCHAR(10) NOT NULL,
  trn_fecha_registro TIMESTAMP NOT NULL,
  trn_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_transacciones;


CREATE TABLE smn_control_acceso.smn_turnos(
  smn_turnos_id INTEGER NOT NULL,
  tur_codigo VARCHAR(16) NOT NULL,
  tur_nombre VARCHAR(48) NOT NULL,
  tur_idioma CHARACTER(2) NOT NULL,
  tur_usuario VARCHAR(10) NOT NULL,
  tur_fecha_registro DATE NOT NULL,
  tur_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_turnos;


CREATE TABLE smn_control_acceso.smn_rotacion_turnos(
  smn_rotacion_turnos_id INTEGER NOT NULL,
  rot_turno VARCHAR(16) NOT NULL,
  rot_consecutivo VARCHAR(48) NOT NULL,
  rot_dia CHARACTER(2) NOT NULL,
  rot_horario CHARACTER(5) NOT NULL,
  rot_idioma CHARACTER(2) NOT NULL,
  rot_usuario VARCHAR(10) NOT NULL,
  rot_fecha_registro DATE NOT NULL,
  rot_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_rotacion_turnos;


CREATE TABLE smn_control_acceso.smn_personal(
  smn_personal_id INTEGER NOT NULL,
  psl_num_control VARCHAR(16) NOT NULL,
  psl_grupo INTEGER NOT NULL,
  psl_grupo_fecha_inicio DATE NOT NULL,
  psl_clase_auxiliar INTEGER NOT NULL,
  psl_auxiliar INTEGER NOT NULL,
  psl_empresa INTEGER,
  psl_sucursal INTEGER,
  psl_area_servicio INTEGER,
  psl_unidad_servicio INTEGER,
  psl_centro_costo INTEGER,
  psl_estructura_organiz INTEGER,
  psl_cargo INTEGER,
  psl_categoria_cargo INTEGER,
  psl_habilita_acceso CHARACTER(1) NOT NULL,
  psl_id_control_acceso VARCHAR(16),
  psl_idioma CHARACTER(2) NOT NULL,
  psl_usuario VARCHAR(10) NOT NULL,
  psl_fecha_registro DATE NOT NULL,
  psl_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_personal;


CREATE TABLE smn_control_acceso.smn_solicitud_permisos(
  smn_solicitud_permisos_id INTEGER NOT NULL,
  smn_personal_id INTEGER NOT NULL,
  spe_detalles VARCHAR(5000) NOT NULL,
  spe_categoria_justif INTEGER NOT NULL,
  spe_fecha_desde DATE,
  spe_fecha_hasta DATE,
  spe_nro_horas DOUBLE PRECISION,
  spe_aprobado_por VARCHAR(60),
  spe_archivo VARCHAR(250),
  spe_contenido VARCHAR(100),
  spe_tamano INTEGER,
  spe_datos_imagen BYTEA,
  spe_idioma CHARACTER(2) NOT NULL,
  spe_usuario VARCHAR(10) NOT NULL,
  spe_fecha_registro DATE NOT NULL,
  spe_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_solicitud_permisos;


CREATE TABLE smn_control_acceso.smn_justificaciones(
  smn_justificaciones_id INTEGER NOT NULL,
  smn_personal_id INTEGER NOT NULL,
  jus_descripcion VARCHAR(5000) NOT NULL,
  jus_fecha_incidencia DATE NOT NULL,
  jus_hora_incidencia CHARACTER(5) NOT NULL,
  jus_tiempo_a_justificar DOUBLE PRECISION NOT NULL,
  jus_aprobado_por VARCHAR(60),
  jus_archivo VARCHAR(250),
  jus_contenido VARCHAR(100),
  jus_tamano INTEGER,
  jus_datos_imagen BYTEA,
  jus_idioma CHARACTER(2) NOT NULL,
  jus_usuario VARCHAR(10) NOT NULL,
  jus_fecha_registro DATE NOT NULL,
  jus_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_justificaciones;


CREATE TABLE smn_control_acceso.smn_movimiento_marcajes(
  smn_movimiento_marcajes_id INTEGER NOT NULL,
  mrk_auxiliar INTEGER NOT NULL,
  mrk_clase_auxiliar INTEGER NOT NULL,
  mrk_control_acceso_id VARCHAR(16) NOT NULL,
  mrk_empresa INTEGER NOT NULL,
  mrk_sucursal INTEGER,
  mrk_area_servicio INTEGER,
  mrk_unidad_servicio INTEGER,
  mrk_centro_costo INTEGER,
  mrk_cargo INTEGER NOT NULL,
  mrk_categoria_cargo INTEGER NOT NULL,
  mrk_marcaje_id VARCHAR(16) NOT NULL,
  mrk_dispositivo_codigo VARCHAR(16) NOT NULL,
  mrk_marcaje_fecha TIMESTAMP NOT NULL,
  mrk_marcaje_hora CHARACTER(5),
  mrk_marcaje_dia CHARACTER(2) NOT NULL,
  mrk_marcaje_tipo CHARACTER(3) NOT NULL,
  mrk_tiempo_efectivo DOUBLE PRECISION,
  mrk_turno INTEGER NOT NULL,
  mrk_consecutivo VARCHAR(16) NOT NULL,
  smn_transaccion_id INTEGER,
  smn_esquema_rotacion_id INTEGER,
  mrk_sede VARCHAR(48),
  mrk_idioma CHARACTER(2) NOT NULL,
  mrk_usuario VARCHAR(10) NOT NULL,
  mrk_fecha_registro DATE NOT NULL,
  mrk_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_movimiento_marcajes;


CREATE TABLE smn_control_acceso.smn_dispositivos(
  smn_dispositivos_id INTEGER NOT NULL,
  dis_codigo VARCHAR(16) NOT NULL,
  dis_nombre VARCHAR(48) NOT NULL,
  dis_empresa INTEGER NOT NULL,
  dis_sucursal INTEGER,
  dis_area_servicio INTEGER,
  dis_unidad_servicio INTEGER,
  dis_tipo_dispositivo CHARACTER(2) NOT NULL,
  dis_serial VARCHAR(32),
  dis_ip_address VARCHAR(16),
  dis_idioma CHARACTER(2) NOT NULL,
  dis_usuario VARCHAR(10) NOT NULL,
  dis_fecha_registro DATE NOT NULL,
  dis_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dispositivos;


CREATE TABLE smn_control_acceso.smn_resumen_marcajes(
  smn_resumen_marcajes_id INTEGER NOT NULL,
  igs_auxiliar INTEGER NOT NULL,
  igs_clase_auxiliar INTEGER NOT NULL,
  igs_control_acceso_id VARCHAR(16) NOT NULL,
  igs_actividad INTEGER NOT NULL,
  igs_tiempo_efectivo DOUBLE PRECISION NOT NULL,
  igs_fecha TIMESTAMP NOT NULL,
  igs_sede VARCHAR(48),
  igs_idioma CHARACTER(2) NOT NULL,
  igs_usuario VARCHAR(10) NOT NULL,
  igs_fecha_registro DATE NOT NULL,
  igs_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_resumen_marcajes;


CREATE TABLE smn_control_acceso.smn_transacciones_manuales(
  smn_transacciones_manuales_id INTEGER NOT NULL,
  trm_sede VARCHAR(48) NOT NULL,
  trm_dispositivo VARCHAR(16) NOT NULL,
  trm_identificacion VARCHAR(16) NOT NULL,
  trm_marcaje VARCHAR(16) NOT NULL,
  trm_tipo_marcaje CHARACTER(3) NOT NULL,
  trm_fecha_transaccion TIMESTAMP NOT NULL,
  trm_hora_transaccion CHARACTER(5) NOT NULL,
  trm_jutificacion VARCHAR(256) NOT NULL,
  trm_idioma CHARACTER(2) NOT NULL,
  trm_usuario VARCHAR(10) NOT NULL,
  trm_fecha_registro TIMESTAMP NOT NULL,
  trm_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_transacciones_manuales;


CREATE TABLE smn_control_acceso.smn_transacciones_desnorm(
  smn_transacciones_desnorm_id INTEGER NOT NULL,
  trd_sede VARCHAR(48) NOT NULL,
  trd_dispositivo VARCHAR(48) NOT NULL,
  trd_identificacion VARCHAR(16) NOT NULL,
  trd_tipo_marcaje VARCHAR(512) NOT NULL,
  trd_fecha_transaccion VARCHAR(2048) NOT NULL,
  trd_hora_transaccion VARCHAR(2048) NOT NULL,
  trd_tiempo_efectivo VARCHAR(512) NOT NULL,
  trd_tiempo_efectivo_total DOUBLE PRECISION NOT NULL,
  trd_status CHARACTER(3) NOT NULL,
  trd_idioma CHARACTER(2) NOT NULL,
  trd_usuario VARCHAR(10) NOT NULL,
  trd_fecha_registro TIMESTAMP NOT NULL,
  trd_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_transacciones_desnorm;


CREATE TABLE smn_control_acceso.smn_lista_control(
  smn_lista_control_id INTEGER NOT NULL,
  ltc_control_acceso_id VARCHAR(16) NOT NULL,
  ltc_dia INTEGER NOT NULL,
  ltc_mes VARCHAR(10) NOT NULL,
  ltc_anio INTEGER NOT NULL,
  ltc_asistio CHARACTER(1) NOT NULL,
  ltc_hora_registro CHARACTER(8)
);

CREATE SEQUENCE smn_control_acceso.seq_smn_lista_control;



ALTER TABLE smn_control_acceso.smn_transacciones ADD PRIMARY KEY (smn_transacciones_id);

ALTER TABLE smn_control_acceso.smn_turnos ADD PRIMARY KEY (smn_turnos_id);

ALTER TABLE smn_control_acceso.smn_rotacion_turnos ADD PRIMARY KEY (smn_rotacion_turnos_id);

ALTER TABLE smn_control_acceso.smn_personal ADD PRIMARY KEY (smn_personal_id);

ALTER TABLE smn_control_acceso.smn_solicitud_permisos ADD PRIMARY KEY (smn_solicitud_permisos_id);
ALTER TABLE smn_control_acceso.smn_solicitud_permisos ADD CONSTRAINT FK_smn_solicitud_permisos_0 FOREIGN KEY (smn_personal_id) REFERENCES smn_control_acceso.smn_personal (smn_personal_id) ON DELETE NO ACTION;

ALTER TABLE smn_control_acceso.smn_justificaciones ADD PRIMARY KEY (smn_justificaciones_id);
ALTER TABLE smn_control_acceso.smn_justificaciones ADD CONSTRAINT FK_smn_justificaciones_0 FOREIGN KEY (smn_personal_id) REFERENCES smn_control_acceso.smn_personal (smn_personal_id) ON DELETE NO ACTION;

ALTER TABLE smn_control_acceso.smn_movimiento_marcajes ADD PRIMARY KEY (smn_movimiento_marcajes_id);

ALTER TABLE smn_control_acceso.smn_dispositivos ADD PRIMARY KEY (smn_dispositivos_id);

ALTER TABLE smn_control_acceso.smn_resumen_marcajes ADD PRIMARY KEY (smn_resumen_marcajes_id);

ALTER TABLE smn_control_acceso.smn_transacciones_manuales ADD PRIMARY KEY (smn_transacciones_manuales_id);

ALTER TABLE smn_control_acceso.smn_transacciones_desnorm ADD PRIMARY KEY (smn_transacciones_desnorm_id);

ALTER TABLE smn_control_acceso.smn_lista_control ADD PRIMARY KEY (smn_lista_control_id);

