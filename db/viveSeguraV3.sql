-- =============================================================================
-- Diagram Name: Vive Segura
-- Created on: 01/03/2016 06:25:03 p.m.
-- Diagram Version: 1.27
-- =============================================================================


DROP TABLE IF EXISTS "usuaria" CASCADE;

CREATE TABLE "usuaria" (
	"id_usuaria" BIGSERIAL NOT NULL,
	"mac_dispositivo" varchar(255),
	"plataforma_dispositivo" int2,
	"nickname_usuaria" varchar(255) NOT NULL,
	"nombre_usuaria" varchar(255),
	"primer_apellido_usuaria" varchar(255),
	"segundo_apellido_usuaria" varchar(255),
	"numero_celular_usuaria" varchar(10),
	"fecha_nacimiento_usuaria" date NOT NULL,
	"id_cat_colonia_cp" int8 NOT NULL,
	"correo_electronico_usuaria" varchar(255),
	"trabaja_usuaria" bool DEFAULT False,
	"estudia_usuaria" bool DEFAULT False,
	"ama_casa_usuaria" bool DEFAULT False,
	"califica_lugar_usuaria" int8 DEFAULT 0,
	"identifica_acoso_usuaria" int8 DEFAULT 0,
	"sensacion_usuaria" int8 DEFAULT 0,
	"reporte_usuaria" int8 DEFAULT 0,
	"boton_panico" int8 DEFAULT 0,
	"fecha_registro_usuaria" date NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_usuaria")
);

DROP TABLE IF EXISTS "cat_colonia_cp" CASCADE;

CREATE TABLE "cat_colonia_cp" (
	"id_cat_colonia_cp" BIGSERIAL NOT NULL,
	"colonia" varchar(255) NOT NULL,
	"codigo_postal" varchar(5) NOT NULL,
	"id_cat_delegacion" int2 NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_colonia_cp")
);

DROP TABLE IF EXISTS "cat_delegacion" CASCADE;

CREATE TABLE "cat_delegacion" (
	"id_cat_delegacion" SMALLSERIAL NOT NULL,
	"delegacion" varchar(255) NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_delegacion")
);

DROP TABLE IF EXISTS "califica_lugar" CASCADE;

CREATE TABLE "califica_lugar" (
	"id_califica_lugar" BIGSERIAL NOT NULL,
	"id_usuaria" int8 NOT NULL,
	"latitud_califica_lugar" varchar(255) NOT NULL,
	"longitud_califica_lugar" varchar(255) NOT NULL,
	"id_cat_lugar" int2 NOT NULL,
	"fecha_califica_lugar" date NOT NULL,
	"calificacion_total" float4 NOT NULL DEFAULT 0,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_califica_lugar")
);

DROP TABLE IF EXISTS "identifica_acoso" CASCADE;

CREATE TABLE "identifica_acoso" (
	"id_identifica_acoso" BIGSERIAL NOT NULL,
	"id_usuaria" int8 NOT NULL,
	"latitud_identifica_acoso" varchar(255) NOT NULL,
	"longitud_identifica_acoso" varchar(255) NOT NULL,
	"id_cat_lugar" int2 NOT NULL,
	"fecha_identifica_acoso" date NOT NULL,
	"calificacion_total" float4 NOT NULL DEFAULT 0,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_identifica_acoso")
);

DROP TABLE IF EXISTS "sensacion" CASCADE;

CREATE TABLE "sensacion" (
	"id_sensacion" BIGSERIAL NOT NULL,
	"id_usuaria" int8 NOT NULL,
	"id_cat_sensacion" int4 NOT NULL,
	"latitud_sensacion" varchar(255) NOT NULL,
	"longitud_sensacion" varchar(255) NOT NULL,
	"id_cat_lugar" int2 NOT NULL,
	"fecha_sensacion" date NOT NULL,
	"calificacion_total" float4 NOT NULL DEFAULT 0,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_sensacion")
);

DROP TABLE IF EXISTS "reporte" CASCADE;

CREATE TABLE "reporte" (
	"id_reporte" BIGSERIAL NOT NULL,
	"id_usuaria" int8 NOT NULL,
	"id_cat_reporte" int4 NOT NULL,
	"latitud_reporte" varchar(255) NOT NULL,
	"longitud_reporte" varchar(255) NOT NULL,
	"comentario_reporte" text NOT NULL,
	"fecha_reporte" date NOT NULL,
	"folio_ssac" varchar(255) NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_reporte")
);

DROP TABLE IF EXISTS "cat_reporte" CASCADE;

CREATE TABLE "cat_reporte" (
	"id_cat_reporte" int4 NOT NULL,
	"reporte" varchar(255) NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_reporte")
);

DROP TABLE IF EXISTS "cat_sensacion" CASCADE;

CREATE TABLE "cat_sensacion" (
	"id_cat_sensacion" int4 NOT NULL,
	"sensacion" varchar(255) NOT NULL,
	"calificacion_sensacion" float4 NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_sensacion")
);

DROP TABLE IF EXISTS "cat_opciones_acoso" CASCADE;

CREATE TABLE "cat_opciones_acoso" (
	"id_cat_opciones_acoso" BIGSERIAL NOT NULL,
	"descripcion_acoso" varchar(255) NOT NULL,
	"calificacion_acoso" float4 NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_opciones_acoso")
);

DROP TABLE IF EXISTS "lista_opciones_acoso" CASCADE;

CREATE TABLE "lista_opciones_acoso" (
	"id_lista_opciones_acoso" BIGSERIAL NOT NULL,
	"id_identifica_acoso" int8 NOT NULL,
	"id_cat_opciones_acoso" int8 NOT NULL,
	PRIMARY KEY("id_lista_opciones_acoso")
);

DROP TABLE IF EXISTS "cat_clasificacion_lugar" CASCADE;

CREATE TABLE "cat_clasificacion_lugar" (
	"id_cat_clasificacion_lugar" int2 NOT NULL,
	"clasificacion_califica_lugar" varchar(255) NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_clasificacion_lugar")
);

DROP TABLE IF EXISTS "cat_opciones_lugar" CASCADE;

CREATE TABLE "cat_opciones_lugar" (
	"id_cat_opciones_lugar" SMALLSERIAL NOT NULL,
	"id_cat_clasificacion_lugar" int2 NOT NULL,
	"opcion" varchar(255) NOT NULL,
	"descripcion" varchar(255) NOT NULL,
	"calificacion_opcion" float4 NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_opciones_lugar")
);

DROP TABLE IF EXISTS "cat_lugar" CASCADE;

CREATE TABLE "cat_lugar" (
	"id_cat_lugar" SMALLSERIAL NOT NULL,
	"lugar" varchar(255) NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_cat_lugar")
);

DROP TABLE IF EXISTS "boton_panico" CASCADE;

CREATE TABLE "boton_panico" (
	"id_boton_panico" BIGSERIAL NOT NULL,
	"id_usuaria" int8 NOT NULL,
	"latitud_boton_panico" varchar(255) NOT NULL,
	"longitud_boton_panico" varchar(255) NOT NULL,
	"fecha_boton_panico" date NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_boton_panico")
);

DROP TABLE IF EXISTS "comentario_califica_lugar" CASCADE;

CREATE TABLE "comentario_califica_lugar" (
	"id_comentario_califica_lugar" BIGSERIAL NOT NULL,
	"id_califica_lugar" int8 NOT NULL,
	"comentario" text NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_comentario_califica_lugar")
);

DROP TABLE IF EXISTS "comentario_identifica_acoso" CASCADE;

CREATE TABLE "comentario_identifica_acoso" (
	"id_comentario_identifica_acoso" BIGSERIAL NOT NULL,
	"id_identifica_acoso" int8 NOT NULL,
	"comentario" text NOT NULL,
	"estatus" int2 NOT NULL DEFAULT 1,
	PRIMARY KEY("id_comentario_identifica_acoso")
);

DROP TABLE IF EXISTS "lista_califica_lugar" CASCADE;

CREATE TABLE "lista_califica_lugar" (
	"id_lista_califica_lugar" BIGSERIAL NOT NULL,
	"id_cat_opciones_lugar" int2 NOT NULL,
	"id_califica_lugar" int8 NOT NULL,
	PRIMARY KEY("id_lista_califica_lugar")
);


ALTER TABLE "usuaria" ADD CONSTRAINT "usuaria_to_cat_colonia_cp" FOREIGN KEY ("id_cat_colonia_cp")
	REFERENCES "cat_colonia_cp"("id_cat_colonia_cp")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "cat_colonia_cp" ADD CONSTRAINT "cat_colonia_cp_to_cat_delegacion" FOREIGN KEY ("id_cat_delegacion")
	REFERENCES "cat_delegacion"("id_cat_delegacion")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE CASCADE
	NOT DEFERRABLE;

ALTER TABLE "califica_lugar" ADD CONSTRAINT "califica_lugar_to_usuaria" FOREIGN KEY ("id_usuaria")
	REFERENCES "usuaria"("id_usuaria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "califica_lugar" ADD CONSTRAINT "califica_lugar_to_cat_lugar" FOREIGN KEY ("id_cat_lugar")
	REFERENCES "cat_lugar"("id_cat_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "identifica_acoso" ADD CONSTRAINT "identifica_acoso_to_usuaria" FOREIGN KEY ("id_usuaria")
	REFERENCES "usuaria"("id_usuaria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "identifica_acoso" ADD CONSTRAINT "identifica_acoso_to_cat_lugar" FOREIGN KEY ("id_cat_lugar")
	REFERENCES "cat_lugar"("id_cat_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "sensacion" ADD CONSTRAINT "sensacion_to_usuaria" FOREIGN KEY ("id_usuaria")
	REFERENCES "usuaria"("id_usuaria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "sensacion" ADD CONSTRAINT "sensacion_to_cat_sensacion" FOREIGN KEY ("id_cat_sensacion")
	REFERENCES "cat_sensacion"("id_cat_sensacion")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "sensacion" ADD CONSTRAINT "sensacion_to_cat_lugar" FOREIGN KEY ("id_cat_lugar")
	REFERENCES "cat_lugar"("id_cat_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "reporte" ADD CONSTRAINT "reporte_to_usuaria" FOREIGN KEY ("id_usuaria")
	REFERENCES "usuaria"("id_usuaria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "reporte" ADD CONSTRAINT "reporte_to_cat_reporte" FOREIGN KEY ("id_cat_reporte")
	REFERENCES "cat_reporte"("id_cat_reporte")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "lista_opciones_acoso" ADD CONSTRAINT "cat_opciones_acoso_has_identifica_acoso_to_cat_opciones_acoso" FOREIGN KEY ("id_cat_opciones_acoso")
	REFERENCES "cat_opciones_acoso"("id_cat_opciones_acoso")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "lista_opciones_acoso" ADD CONSTRAINT "cat_opciones_acoso_has_identifica_acoso_to_identifica_acoso" FOREIGN KEY ("id_identifica_acoso")
	REFERENCES "identifica_acoso"("id_identifica_acoso")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "cat_opciones_lugar" ADD CONSTRAINT "cat_opciones_lugar_to_cat_clasificacion_lugar" FOREIGN KEY ("id_cat_clasificacion_lugar")
	REFERENCES "cat_clasificacion_lugar"("id_cat_clasificacion_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "boton_panico" ADD CONSTRAINT "boton_panico_to_usuaria" FOREIGN KEY ("id_usuaria")
	REFERENCES "usuaria"("id_usuaria")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "comentario_califica_lugar" ADD CONSTRAINT "comentario_califica_lugar_to_califica_lugar" FOREIGN KEY ("id_califica_lugar")
	REFERENCES "califica_lugar"("id_califica_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "comentario_identifica_acoso" ADD CONSTRAINT "comentario_identifica_acoso_to_identifica_acoso" FOREIGN KEY ("id_identifica_acoso")
	REFERENCES "identifica_acoso"("id_identifica_acoso")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "lista_califica_lugar" ADD CONSTRAINT "cat_opciones_lugar_has_califica_lugar_to_cat_opciones_lugar" FOREIGN KEY ("id_cat_opciones_lugar")
	REFERENCES "cat_opciones_lugar"("id_cat_opciones_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;

ALTER TABLE "lista_califica_lugar" ADD CONSTRAINT "cat_opciones_lugar_has_califica_lugar_to_califica_lugar" FOREIGN KEY ("id_califica_lugar")
	REFERENCES "califica_lugar"("id_califica_lugar")
	MATCH SIMPLE
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	NOT DEFERRABLE;


