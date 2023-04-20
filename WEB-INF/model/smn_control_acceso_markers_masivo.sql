DROP TABLE smn_control_acceso.smn_transacciones_manuales;
DROP TABLE smn_control_acceso.smn_resumen_marcajes;
DROP TABLE smn_control_acceso.smn_justificaciones_archivo;
DROP TABLE smn_control_acceso.smn_permisos_archivo;
DROP TABLE smn_control_acceso.smn_dispositivos;
DROP TABLE smn_control_acceso.smn_movimiento_marcajes;
DROP TABLE smn_control_acceso.smn_justificaciones;
DROP TABLE smn_control_acceso.smn_solicitud_permisos;
DROP TABLE smn_control_acceso.smn_personal;
DROP TABLE smn_control_acceso.smn_rotacion_turnos;
DROP TABLE smn_control_acceso.smn_turnos;
DROP TABLE smn_control_acceso.smn_transacciones;

DROP SEQUENCE smn_control_acceso.seq_smn_transacciones_manuales;
DROP SEQUENCE smn_control_acceso.seq_smn_resumen_marcajes;
DROP SEQUENCE smn_control_acceso.seq_smn_justificaciones_archivo;
DROP SEQUENCE smn_control_acceso.seq_smn_permisos_archivo;
DROP SEQUENCE smn_control_acceso.seq_smn_dispositivos;
DROP SEQUENCE smn_control_acceso.seq_smn_movimiento_marcajes;
DROP SEQUENCE smn_control_acceso.seq_smn_justificaciones;
DROP SEQUENCE smn_control_acceso.seq_smn_solicitud_permisos;
DROP SEQUENCE smn_control_acceso.seq_smn_personal;
DROP SEQUENCE smn_control_acceso.seq_smn_rotacion_turnos;
DROP SEQUENCE smn_control_acceso.seq_smn_turnos;
DROP SEQUENCE smn_control_acceso.seq_smn_transacciones;

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

CREATE SEQUENCE smn_control_acceso.seq_smn_transacciones INCREMENT BY 1 MINVALUE 1 START WITH 1;


CREATE TABLE smn_control_acceso.smn_turnos(
  smn_turnos_id INTEGER NOT NULL,
  tur_codigo VARCHAR(16) NOT NULL,
  tur_nombre VARCHAR(48) NOT NULL,
  tur_idioma CHARACTER(2) NOT NULL,
  tur_usuario VARCHAR(10) NOT NULL,
  tur_fecha_registro DATE NOT NULL,
  tur_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_turnos INCREMENT BY 1 MINVALUE 1 START WITH 1;


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

CREATE SEQUENCE smn_control_acceso.seq_smn_rotacion_turnos INCREMENT BY 1 MINVALUE 1 START WITH 1;


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

CREATE SEQUENCE smn_control_acceso.seq_smn_personal INCREMENT BY 1 MINVALUE 1 START WITH 1;


CREATE TABLE smn_control_acceso.smn_solicitud_permisos(
  smn_solicitud_permisos_id INTEGER NOT NULL,
  smn_personal_id INTEGER NOT NULL,
  spe_detalles VARCHAR(5000) NOT NULL,
  spe_categoria_justif INTEGER NOT NULL,
  spe_fecha_desde DATE,
  spe_fecha_hasta DATE,
  spe_nro_horas DOUBLE PRECISION,
  spe_aprobado_por VARCHAR(60),
  spe_idioma CHARACTER(2) NOT NULL,
  spe_usuario VARCHAR(10) NOT NULL,
  spe_fecha_registro DATE NOT NULL,
  spe_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_solicitud_permisos INCREMENT BY 1 MINVALUE 1 START WITH 1;


CREATE TABLE smn_control_acceso.smn_justificaciones(
  smn_justificaciones_id INTEGER NOT NULL,
  smn_personal_id INTEGER NOT NULL,
  jus_descripcion VARCHAR(5000) NOT NULL,
  jus_fecha_incidencia DATE NOT NULL,
  jus_hora_incidencia CHARACTER(5) NOT NULL,
  jus_tiempo_a_justificar DOUBLE PRECISION NOT NULL,
  jus_aprobado_por VARCHAR(60),
  jus_idioma CHARACTER(2) NOT NULL,
  jus_usuario VARCHAR(10) NOT NULL,
  jus_fecha_registro DATE NOT NULL,
  jus_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_justificaciones INCREMENT BY 1 MINVALUE 1 START WITH 1;


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
  mrk_idioma CHARACTER(2) NOT NULL,
  mrk_usuario VARCHAR(10) NOT NULL,
  mrk_fecha_registro DATE NOT NULL,
  mrk_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_movimiento_marcajes INCREMENT BY 1 MINVALUE 1 START WITH 1;


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

CREATE SEQUENCE smn_control_acceso.seq_smn_dispositivos INCREMENT BY 1 MINVALUE 1 START WITH 1;


CREATE TABLE smn_control_acceso.smn_justificaciones_archivo(
  smn_justificaciones_archivo_id INTEGER NOT NULL,
  jus_archivo VARCHAR(250) NOT NULL,
  jus_contenido VARCHAR(100) NOT NULL,
  jus_tamano INTEGER NOT NULL,
  jus_datos_imagen BYTEA NOT NULL,
  jus_idioma CHARACTER(2) NOT NULL,
  jus_usuario VARCHAR(10) NOT NULL,
  jus_fecha_registro DATE NOT NULL,
  jus_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_justificaciones_archivo INCREMENT BY 1 MINVALUE 1 START WITH 1;

CREATE TABLE smn_control_acceso.smn_permisos_archivo(
  smn_permisos_archivo_id INTEGER NOT NULL,
  pma_archivo VARCHAR(250) NOT NULL,
  pma_contenido VARCHAR(100) NOT NULL,
  pma_tamano INTEGER NOT NULL,
  pma_datos_imagen BYTEA NOT NULL,
  pma_idioma CHARACTER(2) NOT NULL,
  pma_usuario VARCHAR(10) NOT NULL,
  pma_fecha_registro DATE NOT NULL,
  pma_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_permisos_archivo INCREMENT BY 1 MINVALUE 1 START WITH 1;

CREATE TABLE smn_control_acceso.smn_resumen_marcajes(
  smn_resumen_marcajes_id INTEGER NOT NULL,
  igs_auxiliar INTEGER NOT NULL,
  igs_clase_auxiliar INTEGER NOT NULL,
  igs_control_acceso_id VARCHAR(16) NOT NULL,
  igs_actividad INTEGER NOT NULL,
  igs_tiempo_efectivo DOUBLE PRECISION NOT NULL,
  igs_fecha TIMESTAMP NOT NULL,
  igs_idioma CHARACTER(2) NOT NULL,
  igs_usuario VARCHAR(10) NOT NULL,
  igs_fecha_registro DATE NOT NULL,
  igs_hora CHARACTER(8) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_resumen_marcajes INCREMENT BY 1 MINVALUE 1 START WITH 1;

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

CREATE SEQUENCE smn_control_acceso.seq_smn_transacciones_manuales INCREMENT BY 1 MINVALUE 1 START WITH 1;



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

ALTER TABLE smn_control_acceso.smn_justificaciones_archivo ADD PRIMARY KEY (smn_justificaciones_archivo_id);

ALTER TABLE smn_control_acceso.smn_permisos_archivo ADD PRIMARY KEY (smn_permisos_archivo_id);

ALTER TABLE smn_control_acceso.smn_resumen_marcajes ADD PRIMARY KEY (smn_resumen_marcajes_id);

ALTER TABLE smn_control_acceso.smn_transacciones_manuales ADD PRIMARY KEY (smn_transacciones_manuales_id);

