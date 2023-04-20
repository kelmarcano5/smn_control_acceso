DROP TABLE smn_control_acceso.smn_lista_control;
DROP TABLE smn_control_acceso.smn_hechos_actividades;
DROP TABLE smn_control_acceso.smn_dim_sede;
DROP TABLE smn_control_acceso.smn_dim_servicio;
DROP TABLE smn_control_acceso.smn_dim_turno;
DROP TABLE smn_control_acceso.smn_dim_cargo;
DROP TABLE smn_control_acceso.smn_dim_empresa;
DROP TABLE smn_control_acceso.smn_dim_tiempo;

CREATE TABLE smn_control_acceso.smn_dim_tiempo(
  smn_dim_tiempo_id INTEGER NOT NULL,
  dtm_anio INTEGER NOT NULL,
  dtm_trimestre CHARACTER(2) NOT NULL,
  dtm_mes VARCHAR(10) NOT NULL,
  dtm_dia INTEGER NOT NULL,
  dtm_fecha DATE NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dim_tiempo;


CREATE TABLE smn_control_acceso.smn_dim_empresa(
  smn_dim_empresa_id INTEGER NOT NULL,
  dem_cod_empresa VARCHAR(16) NOT NULL,
  dem_empresa VARCHAR(48) NOT NULL,
  dem_cod_sucursal VARCHAR(16),
  dem_sucursal VARCHAR(48)
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dim_empresa;


CREATE TABLE smn_control_acceso.smn_dim_cargo(
  smn_dim_cargo_id INTEGER NOT NULL,
  dca_cod_categoria VARCHAR(16) NOT NULL,
  dca_categoria VARCHAR(48) NOT NULL,
  dca_cod_cargo VARCHAR(16) NOT NULL,
  dca_cargo VARCHAR(48) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dim_cargo;


CREATE TABLE smn_control_acceso.smn_dim_turno(
  smn_dim_turno_id INTEGER NOT NULL,
  dtn_codigo VARCHAR(16) NOT NULL,
  dtn_descripcion VARCHAR(48) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dim_turno;


CREATE TABLE smn_control_acceso.smn_dim_servicio(
  smn_dim_servicio_id INTEGER NOT NULL,
  dem_cod_area_servicio VARCHAR(16) NOT NULL,
  dem_area_servicio VARCHAR(48) NOT NULL,
  dem_cod_unidad_servicio VARCHAR(16) NOT NULL,
  dem_unidad_servicio VARCHAR(48) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dim_servicio;


CREATE TABLE smn_control_acceso.smn_dim_sede(
  smn_dim_sede_id INTEGER NOT NULL,
  sed_descripcion VARCHAR(48) NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_dim_sede;


CREATE TABLE smn_control_acceso.smn_hechos_actividades(
  smn_hechos_actividades_id INTEGER NOT NULL,
  smn_dim_empresa_id INTEGER,
  smn_dim_servicio_id INTEGER,
  smn_dim_cargo_id INTEGER,
  smn_dim_turno_id INTEGER NOT NULL,
  smn_dim_tiempo_id INTEGER NOT NULL,
  smn_dim_sede_id INTEGER NOT NULL,
  hch_asistencias INTEGER NOT NULL,
  hch_retrasos INTEGER NOT NULL,
  hch_ausencias INTEGER NOT NULL,
  hch_tiempo_efectivo DOUBLE PRECISION NOT NULL
);

CREATE SEQUENCE smn_control_acceso.seq_smn_hechos_actividades;


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



ALTER TABLE smn_control_acceso.smn_dim_tiempo ADD PRIMARY KEY (smn_dim_tiempo_id);

ALTER TABLE smn_control_acceso.smn_dim_empresa ADD PRIMARY KEY (smn_dim_empresa_id);

ALTER TABLE smn_control_acceso.smn_dim_cargo ADD PRIMARY KEY (smn_dim_cargo_id);

ALTER TABLE smn_control_acceso.smn_dim_turno ADD PRIMARY KEY (smn_dim_turno_id);

ALTER TABLE smn_control_acceso.smn_dim_servicio ADD PRIMARY KEY (smn_dim_servicio_id);

ALTER TABLE smn_control_acceso.smn_dim_sede ADD PRIMARY KEY (smn_dim_sede_id);

ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD PRIMARY KEY (smn_hechos_actividades_id);
ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD CONSTRAINT FK_smn_hechos_actividades_0 FOREIGN KEY (smn_dim_tiempo_id) REFERENCES smn_control_acceso.smn_dim_tiempo (smn_dim_tiempo_id) ON DELETE NO ACTION;
ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD CONSTRAINT FK_smn_hechos_actividades_1 FOREIGN KEY (smn_dim_empresa_id) REFERENCES smn_control_acceso.smn_dim_empresa (smn_dim_empresa_id) ON DELETE NO ACTION;
ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD CONSTRAINT FK_smn_hechos_actividades_2 FOREIGN KEY (smn_dim_cargo_id) REFERENCES smn_control_acceso.smn_dim_cargo (smn_dim_cargo_id) ON DELETE NO ACTION;
ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD CONSTRAINT FK_smn_hechos_actividades_3 FOREIGN KEY (smn_dim_turno_id) REFERENCES smn_control_acceso.smn_dim_turno (smn_dim_turno_id) ON DELETE NO ACTION;
ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD CONSTRAINT FK_smn_hechos_actividades_4 FOREIGN KEY (smn_dim_servicio_id) REFERENCES smn_control_acceso.smn_dim_servicio (smn_dim_servicio_id) ON DELETE NO ACTION;
ALTER TABLE smn_control_acceso.smn_hechos_actividades ADD CONSTRAINT FK_smn_hechos_actividades_5 FOREIGN KEY (smn_dim_sede_id) REFERENCES smn_control_acceso.smn_dim_sede (smn_dim_sede_id) ON DELETE NO ACTION;

ALTER TABLE smn_control_acceso.smn_lista_control ADD PRIMARY KEY (smn_lista_control_id);

