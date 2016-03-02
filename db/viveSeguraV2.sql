-- =============================================================================
-- Diagram Name: Vive Segura
-- Created on: 19/02/2016 04:42:25 p.m.
-- Diagram Version: 1.25
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


-- ----------------------------
-- Records of cat_delegacion
-- ----------------------------
INSERT INTO "cat_delegacion" VALUES ('1', 'Delegacion', '1');
INSERT INTO "cat_delegacion" VALUES ('2', 'Azcapotzalco', '1');
INSERT INTO "cat_delegacion" VALUES ('3', 'Coyoacán', '1');
INSERT INTO "cat_delegacion" VALUES ('4', 'Cuajimalpa de Morelos', '1');
INSERT INTO "cat_delegacion" VALUES ('5', 'Gustavo A. Madero', '1');
INSERT INTO "cat_delegacion" VALUES ('6', 'Iztacalco', '1');
INSERT INTO "cat_delegacion" VALUES ('7', 'Iztapalapa', '1');
INSERT INTO "cat_delegacion" VALUES ('8', 'Magdalena Contreras', '1');
INSERT INTO "cat_delegacion" VALUES ('9', 'Milpa Alta', '1');
INSERT INTO "cat_delegacion" VALUES ('10', 'Álvaro Obregón', '1');
INSERT INTO "cat_delegacion" VALUES ('11', 'Tláhuac', '1');
INSERT INTO "cat_delegacion" VALUES ('12', 'Tlalpan', '1');
INSERT INTO "cat_delegacion" VALUES ('13', 'Xochimilco', '1');
INSERT INTO "cat_delegacion" VALUES ('14', 'Benito Juárez', '1');
INSERT INTO "cat_delegacion" VALUES ('15', 'Cuauhtémoc', '1');
INSERT INTO "cat_delegacion" VALUES ('16', 'Miguel Hidalgo', '1');
INSERT INTO "cat_delegacion" VALUES ('17', 'Venustiano Carranza', '1');


-- ----------------------------
-- Records of cat_colonias_cp
-- ----------------------------
INSERT INTO "cat_colonia_cp" VALUES ('1', 'San Angel', '01000', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('2', 'Los Alpes', '01010', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('3', 'Guadalupe Inn', '01020', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('4', 'Florida', '01030', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('5', 'Axotla', '01030', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('6', 'Campestre', '01040', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('7', 'Las Águilas', '01048', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('8', 'Tlacopac', '01049', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('9', 'Ex-Hacienda de Guadalupe Chimalistac', '01050', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('10', 'San Angel Inn', '01060', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('11', 'Altavista', '01060', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('12', 'Chimalistac', '01070', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('13', 'Progreso Tizapan', '01080', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('14', 'Ermita Tizapan', '01089', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('15', 'Loreto', '01090', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('16', 'Tizapan', '01090', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('17', 'La Otra Banda', '01090', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('18', 'Lomas de Santo Domingo', '01100', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('19', 'Pólvora', '01100', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('20', 'La Conchita', '01109', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('21', 'Ampliación El Capulin', '01110', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('22', 'Belém de las Flores', '01110', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('23', 'Liberales de 1857', '01110', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('24', 'El Capulín', '01110', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('25', 'Las Américas', '01120', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('26', 'Hidalgo', '01120', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('27', 'Acueducto', '01120', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('28', 'Sears Roebuck', '01120', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('29', 'Cove', '01120', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('30', 'Ampliación Acueducto', '01125', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('31', 'Real del Monte', '01130', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('32', 'Paraíso', '01130', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('33', 'Molino de Santo Domingo', '01130', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('34', 'Molino de Santo Domingo', '01130', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('35', 'Reacomodo Pino Suárez', '01139', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('36', 'Bellavista', '01140', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('37', 'José Maria Pino Suárez', '01140', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('38', 'Cristo Rey', '01150', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('39', 'Tolteca', '01150', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('40', '1a Victoria', '01160', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('41', 'Isidro Fabela', '01160', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('42', 'Maria G. de García Ruiz', '01160', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('43', 'Bosque', '01160', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('44', 'Santa Fe IMSS', '01170', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('45', 'Abraham M. González', '01170', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('46', '8 de Agosto', '01180', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('47', 'Carola', '01180', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('48', 'San Pedro de los Pinos', '01180', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('49', 'Torres de San Pedro', '01183', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('50', 'Nelli Campo Bello', '01184', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('51', 'Arturo Martínez', '01200', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('52', 'Belén', '01209', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('53', 'Santa Fe', '01210', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('54', 'Lomas de Santa Fe', '01219', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('55', 'Mártires de Tacubaya', '01220', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('56', 'Cuevitas', '01220', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('57', 'La Estrella', '01220', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('58', 'Zenón Delgado', '01220', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('59', 'Bonanza', '01220', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('60', 'El Cuernito', '01220', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('61', 'Campo de Tiro los Gamitos', '01230', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('62', 'El Piru Santa Fe', '01230', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('63', 'Los Gamitos', '01230', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('64', 'Tlapechico', '01230', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('65', 'El Piru 2a Ampliación', '01230', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('66', 'La Huerta', '01239', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('67', 'Pueblo Nuevo', '01240', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('68', 'Tecolalco', '01250', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('69', 'El Árbol', '01250', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('70', 'Ladera', '01250', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('71', 'Lomas de Nuevo México', '01250', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('72', 'Margarita Maza de Juárez', '01250', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('73', 'Ampliación La Cebada', '01259', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('74', 'La Mexicana 2a Ampliación', '01259', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('75', 'Ampliación La Mexicana', '01260', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('76', 'La Mexicana', '01260', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('77', 'La Palmita', '01260', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('78', 'Calzada Jalalpa', '01260', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('79', 'Liberación Proletaria', '01260', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('80', '1a Sección Cañada', '01269', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('81', '2a Sección Cañada', '01269', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('82', 'El Tejocote', '01270', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('83', 'La Presa', '01270', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('84', 'Golondrinas', '01270', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('85', 'Lomas de Capula', '01270', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('86', 'Golondrinas 1a Sección', '01270', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('87', 'Golondrinas 2a Sección', '01270', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('88', 'Villa Solidaridad', '01275', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('89', 'El Pirul', '01276', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('90', 'Desarrollo Urbano', '01278', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('91', 'Lomas de Becerra', '01279', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('92', 'Arvide', '01280', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('93', 'La Joya', '01280', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('94', 'Francisco Villa', '01280', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('95', 'Lomas de Becerra', '01280', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('96', 'El Pocito', '01280', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('97', 'El Rodeo', '01285', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('98', 'Reacomodo El Cuernito', '01289', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('99', 'Piloto Adolfo López Mateos', '01290', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('100', 'Presidentes', '01290', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('101', 'Jalalpa Tepito 2a Ampliación', '01296', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('102', 'Ampliación Jalalpa', '01296', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('103', 'Jalalpa Tepito', '01296', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('104', 'Ampliación Piloto Adolfo López Mateos', '01298', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('105', '2a Ampliación Presidentes', '01299', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('106', '1a Ampliación Presidentes', '01299', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('107', 'San Gabriel', '01310', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('108', 'Carlos A. Madrazo', '01320', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('109', 'Paseo de las Lomas', '01330', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('110', 'Bejero del Pueblo Santa Fe', '01340', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('111', 'Santa Fe La Loma', '01376', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('112', 'Santa Fe Centro Ciudad', '01376', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('113', 'Santa Fe', '01376', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('114', 'Santa Fe Peña Blanca', '01376', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('115', 'Jalalpa El Grande', '01377', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('116', 'Antonio Carrillo Flores', '01379', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('117', '19 de Mayo', '01388', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('118', 'Santa Fe Tlayapaca', '01389', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('119', 'Preconcreto', '01400', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('120', 'Olivar del Conde 1a Sección', '01400', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('121', 'Galeana', '01407', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('122', 'Olivar del Conde 2a Sección', '01408', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('123', 'Palmas', '01410', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('124', 'Barrio Norte', '01410', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('125', 'Minas Cristo Rey', '01419', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('126', 'Sacramento', '01420', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('127', 'Santa María Nonoalco', '01420', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('128', 'Colina del Sur', '01430', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('129', 'Batallón de San Patricio', '01450', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('130', 'Hogar y Redención', '01450', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('131', 'Unidad Popular Emiliano Zapata', '01450', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('132', 'Cañada del Olivar', '01450', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('133', 'Alfonso XIII', '01460', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('134', 'Alfalfar', '01470', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('135', 'Molino de Rosas', '01470', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('136', 'Lomas de Plateros', '01480', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('137', 'Torres de Mixcoac', '01490', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('138', 'La Cascada', '01490', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('139', 'Miguel Gaona Armenta', '01500', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('140', 'Santa Lucia', '01500', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('141', 'Milpa los Cerros', '01505', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('142', 'Arturo Gamiz', '01506', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('143', 'Tetlalpan', '01507', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('144', 'Ladera Chica', '01508', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('145', 'Santa Lucía Chantepec', '01509', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('146', 'La Araña', '01510', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('147', 'Garcimarrero', '01510', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('148', 'Los Cedros', '01510', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('149', 'Estado de Hidalgo', '01520', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('150', 'Piru Santa Lucia', '01520', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('151', 'Ampliación Los Pirules', '01520', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('152', 'Ampliación Estado de Hidalgo', '01520', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('153', 'El Politoco', '01520', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('154', 'Corpus Christy', '01530', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('155', 'Universal', '01537', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('156', 'Tepopotla', '01538', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('157', 'Acuilotla', '01539', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('158', 'Cooperativa Unión Olivos', '01539', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('159', 'Balcones de Cehuayo', '01540', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('160', 'Llano Redondo', '01540', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('161', 'Punta de Cehuaya', '01540', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('162', 'Cehuaya', '01540', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('163', 'Providencia', '01540', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('164', 'Villa Progresista', '01548', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('165', 'Dos Ríos del Pueblo Santa Lucía', '01549', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('166', 'Tepeaca', '01550', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('167', 'Rinconada Las Cuevitas', '01550', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('168', 'Ampliación Tepeaca', '01550', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('169', 'Canutillo 2a Sección', '01560', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('170', 'Ave Real', '01560', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('171', 'Canutillo', '01560', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('172', 'Canutillo 3a Sección', '01560', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('173', 'Hueytlale', '01566', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('174', 'Tepeaca', '01567', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('175', 'Reacomodo Valentín Gómez Farías', '01569', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('176', 'Rancho Casa Blanca', '01580', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('177', 'Bosques de Tarango', '01580', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('178', 'Real de Tarango', '01586', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('179', 'Misiones de Tarango', '01587', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('180', 'Tarango', '01588', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('181', 'Lomas de Tarango Reacomodo', '01589', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('182', 'El Rincón', '01590', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('183', 'Sociedad Cooperativa Unión Poder Popular', '01600', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('184', 'Merced Gómez', '01600', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('185', 'Profesor J. Arturo López Martínez', '01610', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('186', 'Colinas de Tarango', '01610', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('187', 'Ex-Hacienda de Tarango', '01618', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('188', 'Arcos Centenario', '01618', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('189', 'La Martinica', '01619', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('190', 'Rinconada de Tarango', '01619', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('191', 'Lomas de Tarango', '01620', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('192', 'Lomas de Puerta Grande', '01630', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('193', 'Puerta Grande', '01630', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('194', 'Los Juristas', '01630', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('195', 'Belém de las Flores', '01630', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('196', 'Heron Proal', '01640', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('197', 'Ponciano Arriaga', '01645', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('198', 'Ampliación Tlacuitlapa', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('199', '2o Reacomodo Tlacuitlapa', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('200', 'La Milagrosa', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('201', 'Tlacuitlapa', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('202', 'Palmas Axotitla', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('203', 'El Ruedo', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('204', 'Santa Lucía Chantepec', '01650', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('205', 'Tetelpan', '01700', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('206', 'Ocotillos del Pueblo Tetelpan', '01700', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('207', '2a Del Moral del Pueblo de Tetelpan', '01700', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('208', 'Tecalcapa del Pueblo Tetelpan', '01700', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('209', 'San Agustín del Pueblo Tetelpan', '01700', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('210', 'La Joyita del Pueblo Tetelpan', '01700', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('211', 'El Mirador del Pueblo Tetelpan', '01708', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('212', 'El Encino del Pueblo Tetelpan', '01708', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('213', 'Ampliación Alpes', '01710', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('214', 'Las Águilas', '01710', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('215', 'Lomas de Guadalupe', '01720', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('216', 'Alcantarilla', '01729', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('217', 'Puente Colorado', '01730', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('218', 'Lomas de las Águilas', '01730', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('219', 'San Clemente Sur', '01740', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('220', 'La Peñita del Pueblo Tetelpan', '01740', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('221', 'San Clemente Norte', '01740', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('222', 'Las Aguilas 1a Sección', '01750', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('223', 'Las Aguilas 2o Parque', '01750', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('224', 'Las Aguilas 3er Parque', '01750', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('225', 'Ampliación Las Aguilas', '01759', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('226', 'Flor de Maria', '01760', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('227', 'Atlamaya', '01760', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('228', 'La Herradura del Pueblo Tetelpan', '01760', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('229', 'La Angostura', '01770', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('230', 'San José del Olivar', '01770', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('231', 'Olivar de los Padres', '01780', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('232', 'Tizampampano del Pueblo Tetelpan', '01780', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('233', 'El Olivarito', '01788', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('234', 'Miguel Hidalgo', '01789', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('235', 'Lomas de los Angeles del Pueblo Tetelpan', '01790', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('236', 'Lomas de San Ángel Inn', '01790', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('237', 'San Bartolo Ameyalco', '01800', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('238', 'Rancho San Francisco Pueblo San Bartolo Ameyalco', '01807', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('239', 'Villa Verdún', '01810', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('240', 'Las Haciendas', '01820', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('241', 'Lomas Axomiatla', '01820', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('242', 'Santa Rosa Xochiac', '01830', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('243', 'Torres de Potrero', '01840', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('244', 'Rancho del Carmen del Pueblo San Bartolo Ameyalco', '01849', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('245', 'Rincón de La Bolsa', '01849', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('246', 'Lomas de Chamontoya', '01857', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('247', 'Tlacoyaque', '01859', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('248', 'Lomas de La Era', '01860', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('249', 'Lomas de los Cedros', '01870', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('250', 'Jardines del Pedregal', '01900', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('251', 'San Jerónimo Aculco', '01904', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('252', 'Rancho Anzaldo y Contreras', '01940', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('253', 'Pedregal', '01990', '10', '1');
INSERT INTO "cat_colonia_cp" VALUES ('254', 'Centro de Azcapotzalco', '02000', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('255', 'San Rafael', '02010', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('256', 'Los Reyes', '02010', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('257', 'Nuevo Barrio San Rafael', '02010', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('258', 'San Marcos', '02020', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('259', 'Santo Tomas', '02020', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('260', 'San Sebastián', '02040', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('261', 'Del Maestro', '02040', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('262', 'Libertad', '02050', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('263', 'Santa Maria Malinalco', '02050', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('264', 'Wake', '02050', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('265', 'Sindicato Mexicano de Electricistas', '02060', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('266', 'Un Hogar Para Cada Trabajador', '02060', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('267', 'Del Recreo', '02070', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('268', 'Nextengo', '02070', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('269', 'Palestina', '02070', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('270', 'Azcapotzalco', '02070', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('271', 'Nextengo', '02070', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('272', 'Clavería', '02080', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('273', 'Sector Naval', '02080', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('274', 'San Álvaro', '02090', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('275', 'Angel Zimbron', '02099', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('276', 'El Rosario', '02100', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('277', 'Los Oyameles', '02100', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('278', 'Manuel Rivera Anaya CROC 1', '02109', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('279', 'CROC 6 Olimpia', '02109', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('280', 'San Pablo Xalpa', '02110', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('281', 'Ecológica Novedades Impacto', '02110', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('282', 'San Martín Xochinahuac', '02120', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('283', 'San Martín Xochinahuac', '02125', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('284', 'Tepantongo', '02127', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('285', 'Nueva El Rosario', '02128', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('286', 'Nueva España', '02129', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('287', 'Tierra Nueva', '02130', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('288', 'Santa Ines', '02140', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('289', 'Pasteros', '02150', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('290', 'Azcapotzalco Pasteros', '02150', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('291', 'Santo Domingo', '02160', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('292', 'Villas de Azcapotzalco', '02169', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('293', 'Reynosa Tamaulipas', '02200', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('294', 'Santa Bárbara', '02230', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('295', 'San Andrés Fase II', '02240', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('296', 'Ticoman', '02240', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('297', 'San Andrés', '02240', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('298', 'San Andrés', '02240', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('299', 'Santa Catarina', '02250', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('300', 'Pitolaca', '02260', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('301', 'Industrial Vallejo', '02300', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('302', 'Ferrería', '02310', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('303', 'San Andrés de las Salinas', '02320', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('304', 'Huautla de las Salinas', '02330', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('305', 'Santa Cruz de las Salinas', '02340', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('306', 'Jardines de Ceylán', '02350', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('307', 'Las Salinas', '02360', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('308', 'San Juan Tlihuaca', '02400', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('309', 'San Juan Tlihuaca', '02400', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('310', 'Rinconada el Olivar', '02400', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('311', 'Rosendo Salazar', '02409', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('312', 'Prados del Rosario', '02410', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('313', 'Trabajadores de PEMEX', '02419', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('314', 'Francisco Villa', '02420', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('315', 'Ex-Hacienda El Rosario', '02420', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('316', 'Presidente Madero', '02430', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('317', 'Providencia', '02440', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('318', 'Miguel Hidalgo', '02450', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('319', 'Las Trancas', '02450', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('320', 'Tezozomoc', '02459', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('321', 'La Preciosa', '02460', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('322', 'Axolahua', '02460', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('323', 'Ampliación Petrolera', '02470', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('324', 'Lázaro Cárdenas', '02479', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('325', 'Petrolera', '02480', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('326', 'Kervin', '02490', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('327', 'San Mateo', '02490', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('328', 'Unidad Cuitlahuac', '02500', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('329', 'El Jagüey', '02510', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('330', 'Pantaco', '02510', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('331', 'El Jagüey', '02519', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('332', 'Granjas Pantaco Campamento Ferrocarrilero', '02525', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('333', 'Jardín Azpeitia', '02530', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('334', 'Hogares Ferrocarrileros', '02540', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('335', 'Pro-Hogar', '02600', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('336', 'Coltongo', '02630', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('337', 'Coltongo', '02630', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('338', 'Monte Alto', '02640', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('339', 'Trabajadores de Hierro', '02650', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('340', 'Euzkadi', '02660', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('341', 'Cosmopolita', '02670', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('342', 'Potrero del Llano', '02680', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('343', 'San Miguel Amantla', '02700', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('344', 'San Pedro Xalpa', '02710', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('345', 'San Isidro', '02710', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('346', 'Las Armas', '02718', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('347', 'Ampliación San Pedro Xalpa', '02719', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('348', 'San Bartolo Cahualtongo', '02720', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('349', 'San Antonio', '02720', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('350', 'Campo Encantado', '02729', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('351', 'San Francisco Tetecala', '02730', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('352', 'Miguel Lerdo de Tejada', '02739', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('353', 'La Providencia', '02750', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('354', 'Santiago Ahuizotla', '02750', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('355', 'La Escuadra', '02750', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('356', 'Industrial San Antonio', '02760', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('357', 'Santa Lucia', '02760', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('358', 'Santa Cruz Acayucan', '02770', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('359', 'Plenitud', '02780', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('360', 'Santa Apolonia', '02790', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('361', 'Nueva Santa Maria', '02800', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('362', 'Victoria de las Democracias', '02810', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('363', 'Ignacio Allende', '02810', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('364', 'San Bernabé', '02830', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('365', 'Toronja', '02830', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('366', 'Cobre de México', '02840', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('367', 'Obrero Popular', '02840', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('368', 'Tlatilco', '02850', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('369', 'Tlatilco', '02860', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('370', 'San Salvador Xochimanca', '02870', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('371', 'Aguilera', '02900', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('372', 'Aldana', '02910', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('373', 'Ampliación Cosmopolita', '02920', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('374', 'Liberación', '02930', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('375', 'Porvenir', '02940', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('376', 'Del Gas', '02950', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('377', 'San Francisco Xocotitla', '02960', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('378', 'Ampliación Del Gas', '02970', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('379', 'Patrimonio Familiar', '02980', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('380', 'Arenal', '02980', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('381', 'La Raza', '02990', '2', '1');
INSERT INTO "cat_colonia_cp" VALUES ('382', 'Piedad Narvarte', '03000', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('383', 'Atenor Salas', '03010', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('384', 'Esperanza', '03020', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('385', 'Narvarte Poniente', '03020', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('386', 'Narvarte Oriente', '03023', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('387', 'Narvarte Unidad IMSS', '03023', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('388', 'Del Valle Centro', '03100', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('389', 'Insurgentes San Borja', '03100', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('390', 'Del Valle Norte', '03103', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('391', 'Del Valle Sur', '03104', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('392', 'Tlacoquemecatl', '03200', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('393', 'Centro Urbano Presidente Miguel Alemán', '03220', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('394', 'Actipan', '03230', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('395', 'Acacias', '03240', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('396', 'Portales Sur', '03300', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('397', 'Portales Norte', '03303', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('398', 'Santa Cruz Atoyac', '03310', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('399', 'Modulo Social las Flores', '03313', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('400', 'Residencial Emperadores', '03320', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('401', 'Xoco', '03330', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('402', 'General Pedro Maria Anaya', '03340', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('403', 'Álamos', '03400', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('404', 'Postal', '03410', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('405', 'Miguel Alemán', '03420', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('406', 'Josefa Ortiz de Domínguez', '03430', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('407', 'Niños Héroes', '03440', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('408', 'Nativitas', '03500', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('409', 'Moderna', '03510', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('410', 'Iztaccihuatl', '03520', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('411', 'Villa de Cortes', '03530', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('412', 'Del Carmen', '03540', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('413', 'Zacahuitzco', '03550', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('414', 'Albert', '03560', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('415', 'Portales Oriente', '03570', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('416', 'Miravalle', '03580', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('417', 'Ermita', '03590', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('418', 'Vertiz Narvarte', '03600', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('419', 'Américas Unidas', '03610', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('420', 'Periodista', '03620', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('421', 'Independencia', '03630', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('422', 'Del Lago', '03640', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('423', 'Letrán Valle', '03650', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('424', 'San Simón Ticumac', '03660', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('425', 'Santa Maria Nonoalco', '03700', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('426', 'Ciudad de los Deportes', '03710', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('427', 'Nochebuena', '03720', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('428', 'San Juan', '03730', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('429', 'Extremadura Insurgentes', '03740', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('430', 'San Pedro de los Pinos', '03800', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('431', 'Napoles', '03810', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('432', '8 de Agosto', '03820', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('433', 'Ampliación Napoles', '03840', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('434', 'San José Insurgentes', '03900', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('435', 'Mixcoac', '03910', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('436', 'Insurgentes Mixcoac', '03920', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('437', 'Merced Gómez', '03930', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('438', 'Crédito Constructor', '03940', '14', '1');
INSERT INTO "cat_colonia_cp" VALUES ('439', 'Villa Coyoacán', '04000', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('440', 'Barrio Santa Catarina', '04010', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('441', 'Barrio La Concepción', '04020', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('442', 'Barrio San Lucas', '04030', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('443', 'Parque San Andrés', '04040', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('444', 'Del Carmen', '04100', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('445', 'Viveros de Coyoacán', '04110', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('446', 'San Diego Churubusco', '04120', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('447', 'San Mateo', '04120', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('448', 'Campestre Churubusco', '04200', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('449', 'Churubusco Country Club', '04210', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('450', 'Prado Churubusco', '04230', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('451', 'Ermita Churubusco', '04239', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('452', 'Hermosillo', '04240', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('453', 'Paseos de Taxqueña', '04250', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('454', '20 de Agosto', '04259', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('455', 'San Francisco Culhuacan Barrio de San Juan', '04260', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('456', 'San Francisco Culhuacán Barrio de San Francisco', '04260', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('457', 'San Francisco Culhuacan Barrio de La Magdalena', '04260', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('458', 'San Francisco Culhuacan Barrio de Santa Ana', '04260', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('459', 'Santa Martha del Sur Quetzalcoatl', '04270', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('460', 'Taxqueña', '04280', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('461', 'Ajusco', '04300', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('462', 'Ajusco Montserrat', '04307', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('463', 'Pedregal de Monserrat', '04309', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('464', 'Monte de Piedad', '04310', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('465', 'Romero de Terreros', '04310', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('466', 'ISSSTE', '04317', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('467', 'Barrio Oxtopulco Universidad', '04318', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('468', 'Fortín de Chimalistac', '04319', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('469', 'Torres de Chimalistac', '04319', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('470', 'Romero de Terreros', '04320', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('471', 'Cuadrante de San Francisco', '04320', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('472', 'Dr. Pedro R Bernabé', '04320', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('473', 'Pedregal de San Francisco', '04320', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('474', 'Villa de San Francisco', '04326', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('475', 'Rincón de Guanajuato', '04327', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('476', 'Pueblo de los Reyes', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('477', 'Pacifico', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('478', 'Rinconada de los Reyes', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('479', 'El Rosedal', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('480', 'Pedregal de Coyoacán', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('481', 'Barrio del Niño Jesús', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('482', 'Rosedal', '04330', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('483', 'Zapata', '04336', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('484', 'Montserrat', '04337', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('485', 'Mariana', '04338', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('486', 'Copilco Universidad ISSSTE', '04340', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('487', 'Copilco El Bajo', '04340', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('488', 'Insurgentes San Angel', '04340', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('489', 'Altillo Universidad', '04350', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('490', 'Copilco', '04350', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('491', 'Villas Copilco', '04350', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('492', 'Integración Latinoamericana', '04350', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('493', 'Acasulco', '04350', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('494', 'Copilco El Alto', '04360', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('495', 'Copilco Universidad', '04360', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('496', 'Residencial la Cantera', '04368', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('497', 'Pedregal de Santo Domingo', '04369', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('498', 'Atlántida', '04370', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('499', 'Ciudad Jardín', '04370', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('500', 'Xotepingo 101', '04370', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('501', 'El Rosario', '04380', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('502', 'Pueblo La Candelaria', '04380', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('503', 'Nueva Diaz Ordaz', '04390', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('504', 'Huayamilpas', '04390', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('505', 'Educación', '04400', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('506', 'Petrolera Taxqueña', '04410', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('507', 'Tlalpan FOVISSSTE', '04410', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('508', 'Ex-Ejido de San Francisco Culhuacán', '04420', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('509', 'Culhuacán CTM Sección V', '04440', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('510', 'Culhuacán CTM Sección II', '04440', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('511', 'Culhuacán CTM Sección I', '04440', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('512', 'El Centinela', '04450', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('513', 'Avante', '04460', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('514', 'Presidentes Ejidales 2a Sección', '04470', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('515', 'Presidentes Ejidales 1a Sección', '04470', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('516', 'Culhuacán CTM Sección III', '04480', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('517', 'Culhuacán CTM Sección VI', '04480', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('518', 'Culhuacán CTM CROC', '04480', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('519', 'Culhuacán CTM Sección X-A', '04480', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('520', 'Culhuacán CTM Sección VII', '04489', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('521', 'Culhuacán CTM Sección Piloto', '04490', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('522', 'Culhuacán CTM Canal Nacional', '04490', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('523', 'Jardines del Pedregal de San Ángel', '04500', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('524', 'Multifamiliar Para Maestros', '04513', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('525', 'La Otra Banda', '04519', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('526', 'Insurgentes Cuicuilco', '04530', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('527', 'Torres del Maurel', '04535', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('528', 'Pedregal de Santa Ursula', '04600', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('529', 'Xotepingo', '04610', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('530', 'Pueblo de San Pablo Tepetlapa', '04620', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('531', 'Adolfo Ruiz Cortines', '04630', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('532', 'El Reloj', '04640', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('533', 'Pueblo de Santa Ursula Coapa', '04650', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('534', 'Joyas del Pedregal', '04660', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('535', 'Pedregal de La Zorra', '04660', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('536', 'Villa Panamericana', '04700', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('537', 'Pedregal de Carrasco', '04700', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('538', 'Olímpica', '04710', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('539', 'Vistas del Maurel', '04718', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('540', 'Villas del Pedregal', '04719', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('541', 'Pedregal del Sur', '04719', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('542', 'Pedregal del Maurel', '04720', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('543', 'Rinconada las Playas INFONAVIT', '04729', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('544', 'Cantil del Pedregal', '04730', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('545', 'Bosques de Tetlameya', '04730', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('546', 'Villas del Imán', '04738', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('547', 'El Caracol', '04739', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('548', 'Alianza Popular Revolucionaria', '04800', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('549', 'Los Cedros', '04800', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('550', 'Prados de Coyoacán', '04810', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('551', 'Emiliano Zapata', '04815', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('552', 'Los Cipreses', '04830', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('553', 'Los Ciruelos', '04830', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('554', 'Ex-Ejido de San Pablo Tepetlapa', '04840', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('555', 'Sector Marina', '04849', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('556', 'Fuentes de Coyoacán', '04850', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('557', 'El Hueso INFONAVIT', '04859', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('558', 'Espartaco', '04870', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('559', 'Los Robles', '04870', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('560', 'Los Olivos', '04890', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('561', 'Los Olivos', '04890', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('562', 'Jardines de Coyoacán', '04890', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('563', 'El Parque de Coyoacán', '04899', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('564', 'STUNAM', '04908', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('565', 'La Virgen', '04908', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('566', 'Culhuacán CTM Sección IX-A', '04909', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('567', 'Culhuacán CTM Sección IX-B', '04909', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('568', 'Culhuacán CTM Sección VIII', '04909', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('569', 'Carmen Serdán', '04910', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('570', 'Cafetales', '04918', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('571', 'Emiliano Zapata Fraccionamiento Popular', '04919', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('572', 'Los Girasoles', '04920', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('573', 'Las Campanas', '04929', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('574', 'Santa Cecilia', '04930', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('575', 'Campestre Coyoacán', '04938', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('576', 'Culhuacán CTM Sección X', '04939', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('577', 'Los Sauces', '04940', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('578', 'El Mirador', '04950', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('579', 'Villa Quietud', '04960', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('580', 'Haciendas de Coyoacán', '04970', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('581', 'Viejo Ejido de Santa Ursula Coapa', '04980', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('582', 'Ex-Ejido de Santa Ursula Coapa', '04980', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('583', 'Ex-Hacienda Coapa', '04980', '3', '1');
INSERT INTO "cat_colonia_cp" VALUES ('584', 'Cuajimalpa', '05000', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('585', 'Zentlapatl', '05010', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('586', 'Loma del Padre', '05020', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('587', 'San Pedro', '05030', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('588', 'La Manzanita', '05030', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('589', 'San Pablo Chimalpa', '05050', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('590', 'José Maria Castorena', '05060', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('591', 'Lomas de Vista Hermosa', '05100', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('592', 'Cooperativa Palo Alto', '05110', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('593', 'Granjas Palo Alto', '05118', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('594', 'Campestre Palo Alto', '05119', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('595', 'Bosques de las Lomas', '05120', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('596', 'Villas Marbella', '05126', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('597', 'Cumbres Reforma', '05128', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('598', 'Lomas del Chamizal', '05129', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('599', 'Rincón de las Lomas', '05130', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('600', 'San José de los Cedros', '05200', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('601', 'Club de Golf Bosques', '05214', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('602', 'Granjas Navidad', '05219', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('603', 'Tepetongo', '05220', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('604', 'El Ébano', '05230', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('605', 'Nueva Rosita', '05238', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('606', 'El Molino', '05240', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('607', 'Jardines de la Palma', '05249', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('608', 'Jesús del Monte', '05260', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('609', 'Villas de Cuajimalpa', '05268', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('610', 'Amado Nervo', '05269', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('611', 'Manzanastitla', '05270', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('612', 'Adolfo López Mateos', '05280', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('613', 'El Molinito', '05310', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('614', 'El Yaqui', '05320', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('615', 'Lomas de Memetla', '05330', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('616', 'Ampliación Memetla', '05330', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('617', 'Ampliación el Yaqui', '05330', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('618', 'Memetla', '05330', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('619', 'Santa Fe Cuajimalpa', '05348', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('620', 'Cruz Manca', '05349', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('621', 'Locaxco', '05360', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('622', 'Las Tinajas', '05370', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('623', 'Lomas de San Pedro', '05379', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('624', 'El Tianguillo', '05400', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('625', 'San Lorenzo Acopilco', '05410', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('626', '1° de Mayo', '05410', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('627', 'Contadero', '05500', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('628', 'La Venta', '05520', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('629', 'Abdias Garcia Soto', '05530', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('630', 'San Mateo Tlaltenango', '05600', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('631', 'Santa Rosa Xochiac', '05610', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('632', 'Prados de La Montaña', '05619', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('633', 'Cruz Blanca', '05700', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('634', 'Las Maromas', '05710', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('635', 'Xalpa', '05730', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('636', 'La Pila', '05750', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('637', 'Las Lajas', '05760', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('638', 'Agua Bendita', '05780', '4', '1');
INSERT INTO "cat_colonia_cp" VALUES ('639', 'Centro (Área 1)', '06000', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('640', 'Centro (Área 2)', '06010', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('641', 'Centro (Área 3)', '06020', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('642', 'Tabacalera', '06030', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('643', 'Centro (Área 4)', '06040', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('644', 'Centro (Área 5)', '06050', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('645', 'Centro (Área 6)', '06060', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('646', 'Centro (Área 7)', '06070', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('647', 'Centro (Área 8)', '06080', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('648', 'Centro (Área 9)', '06090', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('649', 'Hipódromo', '06100', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('650', 'Condesa', '06140', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('651', 'Hipódromo Condesa', '06170', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('652', 'Morelos', '06200', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('653', 'Plan Tepito', '06200', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('654', 'Peralvillo', '06220', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('655', 'Valle Gómez', '06240', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('656', 'Ex-Hipódromo de Peralvillo', '06250', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('657', 'Maza', '06270', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('658', 'Felipe Pescador', '06280', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('659', 'Guerrero', '06300', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('660', 'Buenavista', '06350', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('661', 'Santa Maria La Ribera', '06400', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('662', 'Santa Maria Insurgentes', '06430', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('663', 'Atlampa', '06450', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('664', 'San Rafael', '06470', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('665', 'Cuauhtémoc', '06500', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('666', 'Juárez', '06600', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('667', 'Roma Norte', '06700', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('668', 'Doctores', '06720', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('669', 'Unidad Soldominio', '06728', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('670', 'Centro Urbano Benito Juárez', '06740', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('671', 'Roma Sur', '06760', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('672', 'Buenos Aires', '06780', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('673', 'Obrera', '06800', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('674', 'Transito', '06820', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('675', 'Esperanza', '06840', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('676', 'Asturias', '06850', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('677', 'Vista Alegre', '06860', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('678', 'Paulino Navarro', '06870', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('679', 'Algarin', '06880', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('680', 'Ampliación Asturias', '06890', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('681', 'Nonoalco Tlatelolco', '06900', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('682', 'San Simón Tolnahuac', '06920', '15', '1');
INSERT INTO "cat_colonia_cp" VALUES ('683', 'Aragón la Villa', '07000', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('684', 'Rosas del Tepeyac', '07010', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('685', 'Santa Isabel Tola', '07010', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('686', 'Tepetates', '07010', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('687', 'Tepeyac Insurgentes', '07020', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('688', 'Santiago Atzacoalco', '07040', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('689', 'Villa Gustavo A. Madero', '07050', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('690', '15 de Agosto', '07058', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('691', 'Estanzuela', '07060', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('692', 'Triunfo de La República', '07069', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('693', 'Dinamita', '07070', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('694', 'Martín Carrera', '07070', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('695', 'La Cruz', '07070', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('696', 'Gabriel Hernández', '07080', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('697', 'Ampliación Gabriel Hernández', '07089', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('698', 'C.T.M. El Risco', '07090', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('699', 'C.T.M. Atzacoalco', '07090', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('700', 'Cuautepec Barrio Alto', '07100', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('701', 'San Miguel', '07100', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('702', 'San Antonio', '07109', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('703', 'Lomas de Cuautepec', '07110', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('704', 'Malacates', '07119', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('705', 'Ampliación Malacates', '07119', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('706', 'El Tepetatal', '07130', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('707', 'Compositores Mexicanos', '07130', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('708', 'Ampliación Arboledas', '07140', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('709', 'Forestal I', '07140', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('710', 'Arboledas', '07140', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('711', 'Forestal', '07140', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('712', 'Forestal II', '07144', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('713', 'La Lengüeta', '07144', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('714', 'Parque Metropolitano', '07149', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('715', 'La Casilda', '07150', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('716', 'Juventino Rosas', '07150', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('717', 'Loma La Palma', '07160', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('718', 'Graciano Sánchez', '07164', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('719', 'Tlacaélel', '07164', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('720', 'Prados de Cuautepec', '07164', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('721', 'Luis Donaldo Colosio', '07164', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('722', 'Palmatitla', '07170', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('723', 'Cocoyotes', '07180', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('724', 'General Felipe Berriozabal', '07180', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('725', 'Ampliación Cocoyotes', '07180', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('726', '6 de Junio', '07183', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('727', 'Vista Hermosa', '07187', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('728', 'Tlalpexco', '07188', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('729', 'Ahuehuetes', '07189', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('730', 'Valle de Madero', '07190', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('731', 'Del Carmen', '07199', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('732', 'Cuautepec de Madero', '07200', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('733', 'Del Bosque', '07207', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('734', 'Guadalupe Victoria Cuautepec', '07209', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('735', 'Chalma de Guadalupe', '07210', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('736', 'Ampliación Chalma de Guadalupe', '07214', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('737', 'Castillo Chico', '07220', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('738', 'Castillo Grande', '07220', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('739', 'Ampliación Castillo Grande', '07224', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('740', 'Zona Escolar', '07230', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('741', 'Zona Escolar Oriente', '07239', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('742', 'El Arbolillo', '07240', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('743', 'Hayde Solís C', '07248', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('744', 'México Ixapan', '07248', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('745', 'Tablas de Santa Teresa', '07248', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('746', 'Matías Romero', '07248', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('747', 'Tonaca Coutitlán', '07248', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('748', 'El Arbolillo II CROC', '07249', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('749', 'El Arbolillo III CROC', '07249', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('750', 'Benito Juárez', '07250', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('751', 'Ampliación Benito Juárez', '07259', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('752', 'Solidaridad Nacional', '07268', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('753', 'El Arbolillo CTM', '07269', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('754', 'Residencial Acueducto de Guadalupe', '07270', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('755', 'Acueducto de Guadalupe', '07279', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('756', 'Jorge Negrete', '07280', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('757', 'Zona Militar', '07280', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('758', 'La Pastora', '07290', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('759', 'Lindavista Sur', '07300', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('760', 'Lindavista Norte', '07300', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('761', 'Revolución IMSS', '07309', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('762', 'Barrio Candelaria Ticomán', '07310', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('763', 'La Purísima Ticomán', '07320', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('764', 'FOVISSSTE', '07320', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('765', 'Residencial La Escalera', '07320', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('766', 'La Escalera', '07320', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('767', 'PEMEX Lindavista', '07323', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('768', 'Arroyo de Guadalupe', '07326', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('769', 'Sutic Vallejo', '07327', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('770', 'Escuadrón 201 INFONAVIT', '07328', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('771', 'Ticoman', '07329', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('772', 'Santa Maria Ticoman', '07330', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('773', 'San José Ticomán', '07340', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('774', 'La Laguna Ticomán', '07340', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('775', 'Politécnico', '07348', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('776', 'Acueducto de Ticoman 1044', '07349', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('777', 'Guadalupe Ticomán', '07350', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('778', 'San Juan y Guadalupe Ticomán', '07350', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('779', 'San Rafael Ticomán', '07359', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('780', 'San Pedro Zacatenco', '07360', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('781', 'Juan de Dios Bátiz', '07360', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('782', 'Residencial Zacatenco', '07369', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('783', 'Capultitlan', '07370', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('784', 'Maximino Ávila Camacho', '07380', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('785', 'Tlacamaca', '07380', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('786', 'Salvador Díaz Mirón', '07400', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('787', 'Villa Hermosa', '07410', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('788', 'Juan González Romero', '07410', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('789', 'El Coyol', '07420', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('790', 'Nueva Atzacoalco', '07420', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('791', 'Del Obrero', '07430', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('792', 'Vasco de Quiroga', '07440', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('793', 'DM Nacional', '07450', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('794', 'Ferrocarrilera', '07455', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('795', 'Residencial Oriente', '07456', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('796', 'LI Legislatura', '07456', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('797', 'El Coyol 2', '07457', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('798', 'José Maria Morelos y Pavón 2', '07457', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('799', 'Eduardo Molina', '07458', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('800', 'José Maria Morelos y Pavón 1', '07459', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('801', 'Granjas Modernas', '07460', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('802', 'Constitución de La República', '07469', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('803', 'Ampliación San Juan de Aragón', '07470', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('804', 'San Pedro El Chico', '07480', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('805', 'La Pradera', '07500', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('806', 'La Pradera 1a Sección', '07509', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('807', 'Pradera II Sección', '07509', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('808', 'San Felipe de Jesús', '07510', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('809', '25 de Julio', '07520', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('810', 'Campestre Aragón', '07530', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('811', 'Éxito Enseñanza y Triunfo', '07530', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('812', 'La Esmeralda', '07540', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('813', 'El Milagro', '07548', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('814', 'La Esmeralda 1a Sección', '07549', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('815', 'La Esmeralda 2a Sección', '07549', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('816', 'Providencia', '07550', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('817', 'Ampliación Providencia', '07560', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('818', 'Villa de Aragón', '07570', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('819', 'Ampliación Casas Alemán', '07580', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('820', 'Progreso Nacional', '07600', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('821', 'Santa Rosa', '07620', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('822', 'San José de La Escalera', '07630', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('823', 'Santiago Atepetlac', '07640', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('824', 'Ampliación Progreso Nacional', '07650', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('825', 'Guadalupe', '07660', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('826', 'Guadalupe Proletaria', '07670', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('827', 'Ampliación Guadalupe Proletaria', '07680', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('828', 'Nueva Industrial Vallejo', '07700', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('829', 'S C T Vallejo', '07700', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('830', 'Siete Maravillas', '07707', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('831', 'Torres Lindavista', '07708', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('832', 'Lasalle', '07709', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('833', 'La Patera Vallejo', '07710', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('834', 'Lindavista Vallejo I Sección', '07720', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('835', 'San Bartolo Atepehuacan', '07730', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('836', 'Churubusco Tepeyac', '07730', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('837', 'Montevideo', '07730', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('838', 'Planetario Lindavista', '07739', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('839', 'Valle del Tepeyac', '07740', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('840', 'Nueva Vallejo', '07750', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('841', 'Lindavista Vallejo III Sección', '07754', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('842', 'Lindavista Vallejo II Sección', '07755', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('843', 'Magdalena de las Salinas', '07760', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('844', 'Panamericana', '07770', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('845', 'Ampliación Panamericana', '07770', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('846', 'Defensores de La República', '07780', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('847', 'Héroe de Nacozari', '07780', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('848', 'Guadalupe Victoria', '07790', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('849', 'Vallejo Poniente', '07790', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('850', 'Industrial', '07800', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('851', 'Estrella', '07810', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('852', 'Aragón Inguarán', '07820', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('853', 'Tres Estrellas', '07820', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('854', 'Gertrudis Sánchez 1a Sección', '07830', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('855', 'Gertrudis Sánchez 3a Sección', '07838', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('856', 'Gertrudis Sánchez 2a Sección', '07839', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('857', 'Guadalupe Tepeyac', '07840', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('858', '7 de Noviembre', '07840', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('859', 'Bondojito', '07850', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('860', 'Faja de Oro', '07850', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('861', 'Ampliación Emiliano Zapata', '07858', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('862', 'Ampliación Mártires de Río Blanco', '07859', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('863', 'La Joyita', '07860', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('864', 'Tablas de San Agustín', '07860', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('865', 'Belisario Domínguez', '07869', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('866', 'Guadalupe Insurgentes', '07870', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('867', 'Vallejo', '07870', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('868', 'Mártires de Río Blanco', '07880', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('869', 'Emiliano Zapata', '07889', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('870', 'La Joya', '07890', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('871', 'Nueva Tenochtitlan', '07890', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('872', 'Cuchilla La Joya', '07890', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('873', 'La Malinche', '07899', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('874', 'Cuchilla del Tesoro', '07900', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('875', 'Frente Cuchilla del Tesoro', '07909', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('876', 'San Juan de Aragón VII Sección', '07910', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('877', 'San Juan de Aragón VI Sección', '07918', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('878', 'Ex Ejido San Juan de Aragón Sector 32', '07919', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('879', 'San Juan de Aragón', '07920', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('880', 'El Olivo', '07920', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('881', 'Indeco', '07930', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('882', 'Héroes de Chapultepec', '07939', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('883', 'Ex Ejido San Juan de Aragón Sector 33', '07940', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('884', 'San Juan de Aragón', '07950', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('885', 'La Cuchilla', '07958', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('886', 'Aragón FOVISSSTE', '07959', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('887', 'Ex Escuela de Tiro', '07960', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('888', 'Héroes de Cerro Prieto', '07960', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('889', 'Fernando Casas Alemán', '07960', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('890', 'San Juan de Aragón II Sección', '07969', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('891', 'San Juan de Aragón I Sección', '07969', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('892', 'San Juan de Aragón III Sección', '07970', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('893', 'San Juan de Aragón V Sección', '07979', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('894', 'San Juan de Aragón IV Sección', '07979', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('895', 'Modulo Social FOVISSSTE', '07980', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('896', 'Narciso Bassols', '07980', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('897', 'C.T.M. Aragón', '07990', '5', '1');
INSERT INTO "cat_colonia_cp" VALUES ('898', 'Gabriel Ramos Millán Sección Bramadero', '08000', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('899', 'Ex-Ejido de La Magdalena Mixiuhca', '08010', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('900', 'Ampliación Gabriel Ramos Millán', '08020', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('901', 'Mujeres Ilustres', '08029', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('902', 'Gabriel Ramos Millán Sección Cuchilla', '08030', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('903', 'Carlos Zapata Vela', '08040', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('904', 'Talleres', '08040', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('905', 'Agrícola Pantitlan', '08100', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('906', 'Agua Caliente', '08160', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('907', 'Las Rosas', '08170', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('908', 'Residencial Zaragoza', '08180', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('909', 'Belisario Domínguez INFONAVIT', '08188', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('910', 'Flores Magón INFONAVIT', '08189', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('911', 'Viaducto Piedad', '08200', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('912', 'Nueva Santa Anita', '08210', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('913', 'San Pedro', '08220', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('914', 'San Francisco Xicaltongo', '08230', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('915', 'Santiago Norte', '08240', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('916', 'Santa Anita', '08300', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('917', 'La Cruz', '08310', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('918', 'Fraccionamiento Coyuya', '08320', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('919', 'Granjas México', '08400', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('920', 'Cuchilla Agrícola Oriental', '08420', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('921', 'Agrícola Oriental', '08500', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('922', 'El Rodeo', '08510', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('923', 'Hermanos Blancas', '08520', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('924', 'Sur 12C FOVISSSTE', '08560', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('925', 'Sur 20 INFONAVIT', '08580', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('926', 'La Asunción', '08600', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('927', 'Zapotla', '08610', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('928', '5 de Diciembre FOVISSSTE', '08619', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('929', 'Los Reyes', '08620', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('930', 'Mercados 1', '08620', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('931', 'Mercados 2', '08620', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('932', 'San Miguel', '08650', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('933', 'Juventino Rosas', '08700', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('934', 'Tlazintla', '08710', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('935', 'Gabriel Ramos Millán Sección Tlacotal', '08720', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('936', 'Gabriel Ramos Millán', '08730', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('937', 'Los Picos de Iztacalco Sección 2a', '08760', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('938', 'INPI Picos', '08760', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('939', 'Los Picos de Iztacalco Sección 1b', '08760', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('940', 'Los Picos de Iztacalco Sección 1a', '08770', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('941', 'Santiago Sur', '08800', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('942', 'Reforma Iztaccihuatl Norte', '08810', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('943', 'Maestros de Iztacalco', '08820', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('944', 'Santiago', '08820', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('945', 'Militar Marte', '08830', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('946', 'Reforma Iztaccihuatl Sur', '08840', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('947', 'INFONAVIT Iztacalco', '08900', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('948', 'Santa Cruz', '08910', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('949', 'Jardines Tecma', '08920', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('950', 'Mártires de Tlatelolco', '08930', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('951', 'Campamento 2 de Octubre', '08930', '6', '1');
INSERT INTO "cat_colonia_cp" VALUES ('952', 'San Pablo', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('953', 'San Ignacio', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('954', 'Santa Bárbara', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('955', 'San José', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('956', 'La Asunción', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('957', 'San Lucas', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('958', 'San Pedro', '09000', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('959', 'Real del Moral', '09010', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('960', 'Real del Moral INFONAVIT', '09010', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('961', 'Dr. Alfonso Ortiz Tirado', '09020', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('962', 'Paseos de Churubusco', '09030', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('963', 'Central de Abasto', '09040', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('964', 'Paseos de Churubusco FOVISSSTE', '09040', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('965', 'Escuadrón 201', '09060', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('966', 'Sector Popular', '09060', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('967', 'Granjas de San Antonio', '09070', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('968', 'Xopa', '09080', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('969', 'Cacama', '09080', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('970', 'Unidad Modelo', '09089', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('971', 'Héroes de Churubusco', '09090', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('972', 'Mexicaltzingo', '09099', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('973', 'Juan Escutia', '09100', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('974', 'La Valenciana', '09110', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('975', 'Voceadores de México', '09120', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('976', 'San Lorenzo Xicotencatl', '09130', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('977', 'Santa Martha Acatitla Norte', '09140', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('978', 'Fuentes de Zaragoza', '09150', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('979', 'La Concordia', '09150', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('980', 'Solidaridad', '09160', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('981', 'Predio el Brillante', '09160', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('982', 'La Colmena', '09170', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('983', 'Ermita Zaragoza', '09180', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('984', 'Unidad Vicente Guerrero', '09200', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('985', 'Complejo Industrial Ecológico', '09207', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('986', 'Chinampac de Juárez Frente Ix', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('987', 'Chinampac de Juárez Frente X', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('988', 'Hacienda las Flores', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('989', 'Chinampac de Juárez Frente XI', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('990', '6 de Octubre', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('991', 'Chinampac de Juárez Frente VII', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('992', 'Chinampac de Juárez', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('993', 'Chinampac de Juárez Frente VIII', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('994', 'Los Cedros', '09208', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('995', 'Purísima', '09209', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('996', 'Renovación', '09209', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('997', 'Tepalcates I', '09210', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('998', 'Tepalcates', '09210', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('999', 'Moras Primavera', '09210', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1000', 'Reforma Educativa', '09219', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1001', 'Unidad Ejército Constitucionalista', '09220', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1002', 'Cabeza de Juárez Sección VI', '09225', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1003', 'Rotaria', '09226', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1004', 'Lienzo Charro', '09227', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1005', 'Cabeza de Juárez', '09227', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1006', 'Ignacio Zaragoza', '09228', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1007', 'Guelatao Benito Juárez', '09229', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1008', 'El Paraíso', '09230', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1009', 'Ejercito de Oriente', '09230', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1010', 'Álvaro Obregón', '09230', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1011', 'José Maria Morelos y Pavón', '09230', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1012', 'Ejercito de Oriente Zona Peñon', '09239', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1013', 'Progresista', '09240', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1014', 'Albarrada', '09249', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1015', 'Plutarco Elías Calles', '09250', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1016', 'La Regadera', '09250', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1017', 'Las Américas', '09250', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1018', 'Constitución de 1917', '09260', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1019', 'Colonial Iztapalapa', '09270', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1020', 'Jacarandas', '09280', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1021', 'Santa Cruz Meyehualco', '09290', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1022', 'Luis Donaldo Colosio', '09290', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1023', 'Cuartos de Tlatelolco', '09290', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1024', 'Guadalupe del Moral', '09300', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1025', 'Leyes de Reforma 3a Sección', '09310', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1026', 'Leyes de Reforma 1a Sección', '09310', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1027', 'Leyes de Reforma 2a Sección', '09310', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1028', 'Cuchilla del Moral', '09319', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1029', 'Sideral', '09320', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1030', 'Margarita Maza de Juárez', '09330', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1031', 'Albarrada', '09350', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1032', 'Eva Sámano de López Mateos', '09359', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1033', 'INFONAVIT', '09360', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1034', 'Hidalgo y Mina', '09360', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1035', 'Ermita Iztapalapa', '09360', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1036', 'San Miguel', '09360', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1037', 'Ampliación San Miguel', '09360', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1038', 'Norma FOVISSSTE', '09366', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1039', 'P.R.I.', '09368', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1040', 'Gama Gavilán', '09369', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1041', 'Alborada', '09369', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1042', 'El Gavilán', '09369', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1043', 'El Sifón', '09400', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1044', 'San Juanico Nextipac', '09400', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1045', 'La Viga', '09400', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1046', 'Jardines de Churubusco', '09410', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1047', 'Magdalena Atlazolpa', '09410', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1048', 'Aculco', '09410', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1049', 'San José Aculco', '09410', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1050', 'Nueva Rosita', '09420', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1051', 'Los Picos VI-B', '09420', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1052', 'Purísima Atlazolpa', '09429', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1053', 'El Triunfo', '09430', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1054', 'Apatlaco', '09430', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1055', 'Ampliación El Triunfo', '09438', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1056', 'El Retoño', '09440', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1057', 'San Andrés Tetepilco', '09440', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1058', 'Zacahuitzco', '09440', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1059', 'Banjidal', '09450', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1060', 'Justo Sierra', '09460', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1061', 'Sinatel', '09470', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1062', 'Ampliación Sinatel', '09479', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1063', 'El Prado', '09480', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1064', 'Santa Maria Aztahuacan', '09500', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1065', 'Ojito de Agua', '09500', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1066', 'Santa María Aztahuacan Ampliación', '09500', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1067', 'Santa Martha Acatitla', '09510', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1068', 'San Sebastián Tecoloxtitla', '09520', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1069', 'El Edén', '09520', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1070', 'Santa Martha Acatitla Sur', '09530', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1071', 'Monte Alban', '09550', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1072', 'Paraje Zacatepec', '09560', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1073', 'Santa María Aztahuacan', '09570', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1074', 'Cabeza de Juárez 4 o Frente 4', '09577', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1075', 'Fuerte de Loreto', '09577', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1076', 'Cooperativa Biatlon', '09577', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1077', 'Artículo 4°. Constitucional', '09577', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1078', 'Ejercito de Agua Prieta', '09578', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1079', 'Ing. Zaragoza', '09578', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1080', 'Cabeza de Juárez 5 o Frente 5', '09579', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1081', 'Las Rosas', '09579', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1082', 'Santiago Acahualtepec', '09600', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1083', 'Santiago Acahualtepec 1ra. Ampliación', '09608', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1084', 'Santiago Acahualtepec 2a. Ampliación', '09609', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1085', 'Lomas de Zaragoza', '09620', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1086', 'San Miguel Teotongo Sección Acorralado', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1087', 'San Miguel Teotongo Sección Guadalupe', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1088', 'San Miguel Teotongo Sección Jardines', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1089', 'San Miguel Teotongo Sección Palmitas', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1090', 'San Miguel Teotongo Sección Avisadero', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1091', 'San Miguel Teotongo Sección La Cruz', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1092', 'San Miguel Teotongo Sección Mercedes', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1093', 'San Miguel Teotongo Sección Ranchito', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1094', 'San Miguel Teotongo Sección Capilla', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1095', 'San Miguel Teotongo Sección Loma Alta', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1096', 'San Miguel Teotongo Sección Rancho Bajo', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1097', 'San Miguel Teotongo Sección Torres', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1098', 'Diasa', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1099', 'San Miguel Teotongo Sección Corrales', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1100', 'San Miguel Teotongo Sección Iztlahuaca', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1101', 'San Miguel Teotongo Sección Puente', '09630', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1102', 'Campestre Potrero', '09637', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1103', 'Ampliación Emiliano Zapata', '09638', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1104', 'Lomas de la Estancia', '09640', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1105', 'Xalpa', '09640', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1106', 'San Pablo', '09648', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1107', 'Citlalli', '09660', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1108', 'Palmitas', '09670', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1109', 'Tenorios', '09680', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1110', 'Barranca de Guadalupe', '09689', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1111', 'Iztlahuacán', '09690', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1112', 'Miravalles', '09696', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1113', 'Miguel de La Madrid Hurtado', '09698', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1114', 'Buenavista', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1115', 'Cuauhtémoc', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1116', 'Morelos II', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1117', 'Carlos Hank Gonzalez', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1118', 'Desarrollo Urbano Quetzalcoatl', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1119', 'Santa Cruz Meyehualco', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1120', 'Matamoros', '09700', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1121', 'Tejocotes', '09704', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1122', 'Degollado', '09704', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1123', 'La Magueyera', '09704', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1124', 'Prados Iztapalapa', '09704', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1125', 'Arboledas Zafiro', '09704', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1126', '28 de Junio', '09704', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1127', 'Predio Xaltepec', '09705', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1128', 'Predio San Pedro y San Pablo', '09706', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1129', 'San José Buenavista', '09706', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1130', 'Violeta', '09708', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1131', 'Mixcoatl', '09708', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1132', 'Lomas de Santa Cruz', '09709', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1133', 'Los Ángeles Apanoaya', '09710', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1134', 'STUNAM', '09719', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1135', 'Francisco Villa', '09720', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1136', 'La Era', '09720', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1137', 'Sierra del Valle', '09730', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1138', 'Reforma Política', '09730', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1139', 'Anastasio Bustamante', '09740', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1140', 'Presidentes de México', '09740', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1141', 'Las Peñas', '09750', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1142', 'Insurgentes', '09750', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1143', 'La Polvorilla', '09750', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1144', 'Las Torres', '09759', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1145', 'Presidentes y Plaza de La Constitución', '09760', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1146', 'Consejo Agrarista Mexicano', '09760', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1147', 'Residencial del Valle', '09767', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1148', 'Opus 3', '09768', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1149', 'El Triangulo', '09769', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1150', 'Puente Blanco', '09770', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1151', 'Fase II', '09779', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1152', 'El Tesoro', '09780', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1153', 'Fividesu Avenida 3', '09780', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1154', 'Año de Juárez', '09780', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1155', 'El Árbol FOVISSSTE', '09780', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1156', 'INFONAVIT', '09780', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1157', 'Lomas de San Lorenzo', '09780', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1158', 'San Lorenzo Tezonco', '09790', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1159', 'Fuego Nuevo', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1160', 'Barrio Tula', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1161', 'San Antonio Culhuacán', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1162', 'Pueblo Culhuacán', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1163', 'Estrella Culhuacán', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1164', 'Barrio San Antonio Culhuacán', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1165', 'San Simón Culhuacán', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1166', 'Valle de Luces', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1167', 'San Marcos', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1168', 'Predio Maravillas', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1169', 'El Mirador', '09800', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1170', 'Valle de Luces', '09809', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1171', 'Minerva', '09810', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1172', 'Progreso del Sur', '09810', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1173', 'Granjas Esmeralda', '09810', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1174', 'Los Cipreses', '09810', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1175', 'Valle del Sur', '09819', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1176', 'Santa Isabel Industrial', '09820', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1177', 'La Mora Grande', '09820', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1178', 'Estrella del Sur', '09820', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1179', 'Ricardo Flores Magon', '09820', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1180', 'El Santuario', '09820', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1181', 'Ampliación Ricardo Flores Magón', '09828', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1182', 'Villas San Diego', '09829', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1183', 'Ampliación El Santuario', '09829', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1184', 'El Molino', '09830', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1185', 'Jesús Vela', '09830', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1186', 'Lomas El Manto', '09830', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1187', 'Paraje San Juan', '09830', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1188', 'Los Ángeles', '09830', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1189', 'El Manto', '09830', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1190', 'Cuitlahuac', '09836', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1191', 'San Miguel 8va. Ampliación', '09837', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1192', 'Plan de Iguala', '09838', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1193', 'San Juan FOVISSSTE', '09839', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1194', 'Alcanfores', '09839', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1195', 'San Lorenzo Tezonco FOVISSSTE', '09839', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1196', 'Ampliación Paraje San Juan', '09839', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1197', 'San Juan Joya', '09839', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1198', 'Los Reyes Culhuacán', '09840', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1199', 'Ampliación Los Reyes', '09849', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1200', 'Naranjos', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1201', 'San Nicolás Tolentino', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1202', 'San Juan Xalpa', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1203', 'Cedros', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1204', 'San Juan Xalpa', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1205', 'San Nicolás Tolentino', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1206', 'Vikingos', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1207', 'Popular Oriente', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1208', 'Predio Nautla', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1209', 'Carolinas', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1210', 'Santa Maria del Monte', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1211', 'Lirios FOVISSSTE', '09850', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1212', 'Ampliación Veracruzana', '09856', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1213', 'Estado de Veracruz', '09856', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1214', 'San Francisco INFONAVIT', '09857', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1215', 'San Lorenzo', '09857', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1216', 'El Tule', '09857', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1217', 'Paraje San Juan Cerro', '09858', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1218', 'Benito Juárez', '09859', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1219', 'Sabadell Bellavista', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1220', 'Ampliación Bellavista', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1221', 'Cerro de La Estrella', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1222', 'Viva Sur', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1223', 'España', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1224', 'Casa Blanca', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1225', 'Reforma Garay INFONAVIT', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1226', 'Bellavista', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1227', 'Parque Nacional Cerro  de la Estrella', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1228', 'El Rodeo', '09860', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1229', 'Bertha Von Bloumer', '09864', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1230', 'San Juan Estrella', '09868', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1231', 'Plaza Estrella I', '09868', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1232', 'Plaza Estrella II', '09869', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1233', 'Santa María Tomatlán', '09870', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1234', 'La Loma', '09870', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1235', '12 de Diciembre', '09870', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1236', 'San Andrés Tomatlán', '09870', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1237', 'San Andrés Tomatlán', '09870', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1238', 'Cooperativa de Trabajadores Sector Pesca', '09880', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1239', 'El Vergel', '09880', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1240', '22 CTM', '09880', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1241', 'Campestre Estrella', '09880', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1242', 'Granjas Estrella', '09880', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1243', 'Jacarandas', '09880', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1244', 'Militar Sedena', '09885', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1245', 'Triangulo de las Agujas', '09885', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1246', 'Rinconada Estrella', '09889', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1247', 'Benito Juárez', '09890', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1248', 'Lomas Estrella', '09890', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1249', 'Carlos Jonguitud Barrios', '09897', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1250', 'Residencial Venecia', '09897', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1251', 'Villas Estrella', '09898', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1252', 'Lomas Estrella FOVISSSTE', '09899', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1253', 'San Lorenzo', '09900', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1254', 'Guadalupe', '09900', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1255', 'San Antonio', '09900', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1256', 'La Esperanza', '09910', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1257', 'Los Mirasoles', '09910', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1258', 'José López Portillo', '09920', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1259', 'El Rosario', '09930', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1260', 'Jardines de San Lorenzo Tezonco', '09940', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1261', 'Moyocoyani', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1262', 'Huasipungo', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1263', 'Celoalliotli', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1264', 'Allapetlalli', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1265', 'Rinconada del Molino', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1266', 'Nueva Generación', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1267', 'Najalti', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1268', 'La Planta', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1269', 'USCOVI', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1270', 'El Molino Tezonco', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1271', 'Cooperativa Tlaltenco', '09960', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1272', 'Cananea', '09969', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1273', 'Valle de San Lorenzo', '09970', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1274', 'Carmen Serdán', '09979', '7', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1275', 'Lomas Quebradas', '10000', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1276', 'La Malinche', '10010', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1277', 'San Bartolo Ameyalco', '10010', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1278', 'Cuauhtémoc', '10020', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1279', 'Unidad Independencia IMSS', '10100', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1280', 'Puente Sierra', '10110', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1281', 'Batán Viejo', '10130', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1282', 'San Jerónimo Lídice', '10200', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1283', 'San Bernabé Ocotepec', '10300', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1284', 'El Oasis de San Bernabé', '10309', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1285', 'El Tanque', '10320', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1286', 'Las Cruces', '10330', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1287', 'Los Padres', '10340', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1288', 'Lomas de San Bernabé', '10350', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1289', 'Huayatla', '10360', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1290', 'Ampliación Potrerillo', '10368', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1291', 'Tierra Unida', '10369', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1292', 'Ampliación Lomas de San Bernabé', '10369', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1293', 'Palmas', '10370', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1294', 'Atacaxco', '10378', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1295', 'Vista Hermosa', '10379', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1296', 'Barros Sierra', '10380', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1297', 'San Jerónimo Aculco', '10400', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1298', 'Barrio San Francisco', '10500', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1299', 'La Presilla', '10508', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1300', 'Residencial San Carlos', '10509', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1301', 'Barranca Seca', '10580', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1302', 'El Rosal', '10600', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1303', 'El Toro', '10610', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1304', 'Potrerillo', '10620', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1305', 'Crescencio Juárez Chavira', '10630', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1306', 'La Carbonera', '10640', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1307', 'Pueblo Nuevo Alto', '10640', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1308', 'Pueblo Nuevo Bajo', '10640', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1309', 'Rancho Pachita', '10650', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1310', 'El Ermitaño', '10660', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1311', 'Héroes de Padierna', '10700', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1312', 'Santa Teresa', '10710', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1313', 'Pedregal 2', '10720', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1314', 'Santa Teresa', '10730', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1315', 'La Cruz', '10800', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1316', 'San Francisco', '10810', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1317', 'La Guadalupe', '10820', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1318', 'La Concepción', '10830', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1319', 'Plazuela del Pedregal', '10840', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1320', 'Las Calles', '10840', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1321', 'San Nicolás Totolapan', '10900', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1322', 'La Magdalena', '10910', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1323', 'Las Huertas', '10920', '8', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1324', 'Lomas de Chapultepec VII Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1325', 'Lomas de Chapultepec V Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1326', 'Lomas de Chapultepec VIII Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1327', 'Lomas de Chapultepec II Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1328', 'Lomas de Chapultepec VI Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1329', 'Lomas de Chapultepec I Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1330', 'Lomas de Chapultepec III Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1331', 'Lomas de Chapultepec IV Sección', '11000', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1332', 'Molino del Rey', '11040', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1333', 'Lomas de Sotelo', '11200', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1334', 'Lomas Hermosa', '11200', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1335', 'San Lorenzo Tlaltenango', '11210', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1336', 'Periodista', '11220', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1337', 'Hermanos Serdán', '11220', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1338', 'Argentina Poniente', '11230', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1339', 'México Tacuba', '11239', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1340', 'Ignacio Manuel Altamirano', '11240', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1341', '10 de Abril', '11250', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1342', 'Lázaro Tata', '11259', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1343', 'San Joaquín', '11260', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1344', 'México Nuevo', '11260', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1345', 'Argentina Antigua', '11270', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1346', 'Torre Blanca', '11280', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1347', 'Ampliación Torre Blanca', '11289', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1348', 'San Diego Ocoyoacac', '11290', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1349', 'Huíchapan', '11290', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1350', 'Veronica Anzures', '11300', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1351', 'Mariano Escobedo', '11310', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1352', 'Anahuac II Sección', '11320', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1353', 'Anahuac I Sección', '11320', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1354', 'Un Hogar Para Nosotros', '11330', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1355', 'Santo Tomas', '11340', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1356', 'Plutarco Elías Calles', '11350', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1357', 'Agricultura', '11360', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1358', 'Tlaxpana', '11370', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1359', 'Popotla', '11400', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1360', 'Legaria', '11410', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1361', 'Tacuba', '11410', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1362', 'Nextitla', '11420', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1363', 'Ventura Pérez de Alva', '11430', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1364', 'Pensil Norte', '11430', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1365', 'Reforma Pensil', '11440', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1366', 'San Juanico', '11440', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1367', 'Modelo Pensil', '11450', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1368', 'Ahuehuetes Anahuac', '11450', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1369', 'Peralitos', '11450', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1370', 'Lago Sur', '11460', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1371', 'Los Manzanos', '11460', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1372', 'Dos Lagos', '11460', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1373', 'Lago Norte', '11460', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1374', '5 de Mayo', '11470', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1375', 'Deportivo Pensil', '11470', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1376', 'Unidad Legaria IMSS', '11479', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1377', 'Popo', '11480', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1378', 'Francisco I Madero', '11480', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1379', 'Ampliación Popo', '11489', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1380', 'Cuauhtémoc Pensil', '11490', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1381', 'Pensil Sur', '11490', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1382', 'Irrigación', '11500', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1383', 'Polanco I Sección', '11510', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1384', 'Granada', '11520', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1385', 'Ampliación Granada', '11529', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1386', 'Polanco II Sección', '11530', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1387', 'Polanco III Sección', '11540', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1388', 'Polanco IV Sección', '11550', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1389', 'Polanco V Sección', '11560', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1390', 'Bosque de Chapultepec I Sección', '11580', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1391', 'Anzures', '11590', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1392', 'Residencial Militar', '11600', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1393', 'Manuel Avila Camacho', '11610', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1394', 'Reforma Social', '11650', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1395', 'Bosque de las Lomas', '11700', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1396', 'Escandón I Sección', '11800', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1397', 'Escandón II Sección', '11800', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1398', '16 de Septiembre', '11810', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1399', 'América', '11820', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1400', 'Daniel Garza', '11830', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1401', 'Ampliación Daniel Garza', '11840', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1402', 'San Miguel Chapultepec II Sección', '11850', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1403', 'San Miguel Chapultepec I Sección', '11850', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1404', 'Observatorio', '11860', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1405', 'Tacubaya', '11870', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1406', 'Lomas de Bezares', '11910', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1407', 'Real de las Lomas', '11920', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1408', 'Lomas de Reforma', '11930', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1409', 'Lomas Altas', '11950', '16', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1410', 'Santa Cruz (Villa Milpa Alta)', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1411', 'Santa Martha (Villa Milpa Alta)', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1412', 'La Luz (Villa Milpa Alta)', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1413', 'Los Ángeles (Villa Milpa Alta)', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1414', 'San Mateo (Villa Milpa Alta)', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1415', 'Villa Milpa Alta Centro', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1416', 'La Concepción (Villa Milpa Alta)', '12000', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1417', 'San Agustin (Villa Milpa Alta)', '12070', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1418', 'San Agustin Ohtenco', '12080', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1419', 'Cruztitla (San Antonio Tecomitl)', '12100', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1420', 'Tecaxtitla (San Antonio Tecomitl)', '12100', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1421', 'Xaltipac (San Antonio Tecomitl)', '12100', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1422', 'Tenantitla (San Antonio Tecomitl)', '12100', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1423', 'Xochitepec (San Antonio Tecomitl)', '12100', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1424', 'Emiliano Zapata', '12110', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1425', 'La Conchita', '12110', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1426', 'Panchimalco (San Pedro Atocpan)', '12200', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1427', 'Tula (San Pedro Atocpan)', '12200', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1428', 'Nochtla (San Pedro Atocpan)', '12200', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1429', 'Ocotitla (San Pedro Atocpan)', '12200', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1430', 'San Bartolomé Xicomulco', '12250', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1431', 'San Salvador Cuauhtenco', '12300', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1432', 'Centro (San Pablo Oztotepec)', '12400', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1433', 'San Juan (San Pablo Oztotepec)', '12400', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1434', 'San Miguel (San Pablo Oztotepec)', '12400', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1435', 'Chalmita (San Pablo Oztotepec)', '12410', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1436', 'San Lorenzo Tlacoyucan', '12500', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1437', 'San Jerónimo Miacatlán', '12600', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1438', 'San Francisco Tecoxpa', '12700', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1439', 'San Juan Tepenahuac', '12800', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1440', 'La Lupita Teticpac (Santa Ana Tlacotenco)', '12910', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1441', 'San Marcos (Santa Ana Tlacotenco)', '12920', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1442', 'San Miguel (Santa Ana Tlacotenco)', '12930', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1443', 'San José (Santa Ana Tlacotenco)', '12940', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1444', 'La Lupita Xolco (Santa Ana Tlacotenco)', '12950', '9', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1445', 'La Asunción', '13000', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1446', 'Santa Cecilia', '13010', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1447', 'San José', '13020', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1448', 'San Juan', '13030', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1449', 'San Mateo', '13040', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1450', 'La Habana', '13050', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1451', 'La Guadalupe', '13060', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1452', 'Santa Ana', '13060', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1453', 'Hombres de la Reforma', '13060', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1454', 'Geovillas de Xochimilco', '13063', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1455', 'La Magdalena', '13070', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1456', 'San Miguel', '13070', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1457', 'Los Reyes', '13080', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1458', 'Quiahuatla', '13090', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1459', 'San Sebastián', '13093', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1460', 'San Isidro', '13094', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1461', 'San Andrés', '13099', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1462', 'La Guadalupe', '13100', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1463', 'Ampliación Santa Catarina', '13120', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1464', 'Santiago', '13120', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1465', 'La Concepción', '13150', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1466', 'San Miguel', '13180', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1467', 'Miguel Hidalgo', '13200', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1468', 'Zapotitlán', '13209', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1469', 'Los Olivos', '13210', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1470', 'Ampliación Los Olivos', '13219', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1471', 'Las Arboledas', '13219', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1472', 'La Nopalera', '13220', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1473', 'Tláhuac 2', '13229', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1474', 'Granjas Cabrera', '13230', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1475', 'La Turba', '13250', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1476', 'Del Mar', '13270', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1477', 'Cooperativa C.I.A.N.I.', '13270', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1478', 'La Draga', '13273', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1479', 'Villas Trabajadores del Gobierno del Distrito Federal', '13278', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1480', 'Villa Centro Americana', '13278', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1481', 'Nueva Tenochtitlán', '13278', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1482', 'Agrícola Metropolitana', '13280', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1483', 'Santa Ana Poniente', '13300', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1484', 'Santa Ana Centro', '13300', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1485', 'Manuel M López III', '13300', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1486', 'Santa Ana Norte', '13300', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1487', 'Santiago Centro', '13300', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1488', 'Santiago Norte', '13300', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1489', 'Zapotitla', '13310', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1490', 'Ampliación Zapotitla', '13315', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1491', 'Los Volcanes', '13316', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1492', 'Manuel M López II', '13316', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1493', 'Manuel Gutierrez Najera', '13316', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1494', 'Aurorita', '13317', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1495', 'Nueva Tenochtitlán', '13317', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1496', 'La Herradura', '13318', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1497', 'La Estación', '13319', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1498', 'Benito Quezada', '13319', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1499', 'La Conchita Zapotitlán', '13360', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1500', 'Santa Ana Sur', '13360', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1501', 'Santiago Sur', '13360', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1502', 'San Francisco Tlaltenco', '13400', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1503', 'La Orilla', '13410', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1504', 'López Portillo', '13410', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1505', 'Ampliación José López Portillo', '13419', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1506', 'Selene', '13420', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1507', 'Ampliación Selene', '13430', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1508', 'Zacatenco', '13440', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1509', 'Zacatenco', '13440', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1510', 'Géminis', '13440', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1511', 'Ojo de Agua', '13450', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1512', 'Guadalupe Tlaltenco', '13450', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1513', 'El Triangulo', '13460', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1514', 'La Soledad', '13508', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1515', 'San Agustin', '13508', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1516', 'La Concepción', '13509', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1517', 'La Lupita', '13510', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1518', 'Francisco Villa', '13520', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1519', 'La Asunción', '13530', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1520', 'Jaime Torres Bodet', '13530', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1521', 'Tierra Blanca', '13540', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1522', 'El Rosario', '13540', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1523', 'Ampliación La Conchita', '13545', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1524', 'Peña Alta', '13549', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1525', 'Potrero del Llano', '13550', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1526', 'Jardines del Llano', '13550', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1527', 'Villa Tlatempa', '13559', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1528', 'San Bartolomé', '13600', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1529', 'Los Reyes', '13610', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1530', 'Santa Cruz', '13625', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1531', 'San Agustín', '13630', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1532', 'San Miguel', '13640', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1533', 'San Nicolás Tetelco', '13700', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1534', 'Tepantitlamilco', '13700', '11', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1535', 'Tlalpan Centro', '14000', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1536', 'Tlalpan', '14000', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1537', 'Parque del Pedregal', '14010', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1538', 'Insurgentes Cuicuilco', '14018', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1539', 'Villa Olímpica', '14020', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1540', 'Isidro Fabela', '14030', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1541', 'Luis Donaldo Colosio', '14038', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1542', 'Zapote 1', '14038', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1543', 'Cuitlahuac', '14039', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1544', 'Ampliación Isidro Fabela', '14039', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1545', 'Pueblo Quieto', '14040', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1546', 'Cantera Puente de Piedra', '14040', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1547', 'Comuneros de Santa Úrsula', '14049', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1548', 'Toriello Guerra', '14050', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1549', 'Peña Pobre', '14060', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1550', 'San Pedro Apóstol', '14070', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1551', 'Paseos de Mendoza', '14070', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1552', 'Barrio San Fernando', '14070', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1553', 'Rómulo Sanchez Mireles', '14070', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1554', 'Barrio del Niño Jesús', '14080', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1555', 'Belisario Domínguez Sección XVI', '14080', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1556', 'La Joya', '14090', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1557', 'Torres Tlalpan FOVISSSTE', '14098', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1558', 'Pedregal de San Nicolás 2A Sección', '14100', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1559', 'Pedregal de San Nicolás 5A Sección', '14100', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1560', 'Pedregal de San Nicolás 3A Sección', '14100', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1561', 'Pedregal de San Nicolás 4A Sección', '14100', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1562', 'Pedregal de San Nicolás 1A Sección', '14100', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1563', 'Pedregal Chichicaspatl', '14108', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1564', 'Chichicaspatl', '14108', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1565', 'Ampliación Fuentes del Pedregal', '14110', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1566', 'Pedregal del Lago', '14110', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1567', 'Rincón del Pedregal', '14120', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1568', 'Residencial Pedregal Picacho', '14129', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1569', 'PEMEX', '14130', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1570', 'Fuentes del Pedregal', '14140', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1571', 'Retornos del Pedregal', '14148', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1572', 'Lomas del Pedregal Framboyanes', '14150', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1573', 'Popular Santa Teresa', '14160', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1574', 'Héroes de Padierna', '14200', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1575', 'Jardines del Ajusco', '14200', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1576', 'Colinas del Ajusco', '14208', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1577', 'Torres de Padierna', '14209', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1578', 'Jardines en la Montaña', '14210', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1579', 'Cuchilla de Padierna', '14220', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1580', 'Lomas del Pedregal', '14220', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1581', 'Cultura Maya', '14230', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1582', 'Los Encinos', '14239', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1583', 'Lomas de Padierna', '14240', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1584', 'Lomas Hidalgo', '14240', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1585', 'Cruz del Farol', '14248', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1586', 'Miguel Hidalgo 4A Sección', '14250', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1587', 'Miguel Hidalgo 2A Sección', '14250', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1588', 'Miguel Hidalgo 3A Sección', '14250', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1589', 'Miguel Hidalgo', '14250', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1590', 'Barrio El Capulín', '14260', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1591', 'Miguel Hidalgo 1A Sección', '14260', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1592', 'Zacayucan Peña Pobre', '14266', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1593', 'Barrio de Caramagüey', '14267', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1594', 'Barrio La Lonja', '14268', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1595', 'Barrio La Fama', '14269', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1596', 'Residencial Miramontes', '14300', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1597', 'Nueva Oriental Coapa', '14300', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1598', 'Residencial Acoxpa', '14300', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1599', 'Villa del Sur', '14307', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1600', 'Ex Hacienda Coapa', '14308', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1601', 'Belisario Domínguez', '14310', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1602', 'Vergel Tlalpan', '14310', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1603', 'Floresta Coyoacán', '14310', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1604', 'Vergel Coapa', '14320', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1605', 'Gabriel Ramos Millán', '14324', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1606', 'Rinconada Coapa 2A Sección', '14325', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1607', 'Tenorios INFONAVIT', '14326', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1608', 'Tenorios', '14326', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1609', 'Tenorios 2', '14327', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1610', 'Villa Valbadena', '14328', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1611', 'Lotería Nacional', '14328', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1612', 'Tenorios FOVISSSTE', '14329', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1613', 'Residencial Hacienda Coapa', '14330', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1614', 'Granjas Coapa', '14330', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1615', 'Rinconada Coapa 1A Sección', '14330', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1616', 'Sauzales Cebadales', '14334', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1617', 'Periférico', '14335', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1618', 'Villa del Puente', '14335', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1619', 'Villa Cuemanco INFONAVIT', '14336', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1620', 'Urbano Coapa', '14337', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1621', 'Fuerza Armada de México', '14338', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1622', 'FOVISSSTE Periférico', '14338', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1623', 'Dr. Ignacio Chávez INFONAVIT', '14339', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1624', 'Vergel de Coyoacán', '14340', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1625', 'Vergel del Sur', '14340', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1626', 'Prado Coapa 1A Sección', '14350', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1627', 'Jardines Villa Coapa', '14356', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1628', 'Prado Coapa 2A Sección', '14357', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1629', 'Prado Coapa 3A Sección', '14357', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1630', 'Residencial Villa Prado Coapa', '14358', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1631', 'Magisterial', '14360', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1632', 'Villa Cuemanco', '14360', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1633', 'Magisterial Coapa', '14360', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1634', 'San Lorenzo Huipulco', '14370', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1635', 'Hacienda de San Juan de Tlalpan 2a Sección', '14370', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1636', 'Villa Lázaro Cárdenas', '14370', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1637', 'Chimalli', '14370', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1638', 'Arboledas del Sur', '14376', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1639', 'Hacienda San Juan', '14377', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1640', 'Rincón de San Juan', '14378', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1641', 'A.M.S.A', '14380', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1642', 'San Bartolo El Chico', '14380', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1643', 'Rancho los Colorines', '14386', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1644', 'Ex Hacienda San Juan de Dios', '14387', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1645', 'Guadalupe', '14388', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1646', 'Arenal de Guadalupe', '14389', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1647', 'Narciso Mendoza', '14390', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1648', 'Rinconada Las Hadas', '14390', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1649', 'Residencial Villa Coapa', '14390', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1650', 'Villa Coapa', '14390', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1651', 'Villa Royale', '14399', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1652', 'San Andrés Totoltepec', '14400', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1653', 'Divisadero', '14406', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1654', 'Nuevo Renacimiento de Axalco', '14408', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1655', 'Tecorral', '14409', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1656', 'Fuentes Brotantes', '14410', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1657', 'Santa Úrsula Xitla', '14420', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1658', 'Mesa de los Hornos', '14420', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1659', 'Cumbres de Tepetongo', '14420', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1660', 'Texcaltenco', '14426', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1661', 'Tlaxcaltenco La Mesa', '14426', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1662', 'Tepeximilpa La Paz', '14427', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1663', 'San Juan Tepeximilpa', '14427', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1664', 'Cantera', '14428', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1665', 'Santísima Trinidad', '14429', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1666', 'Tlalcoligia', '14430', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1667', 'Barrio El Truenito', '14430', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1668', 'Pedregal de Santa Úrsula Xitla', '14438', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1669', 'Pedregal de las Águilas', '14439', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1670', 'Los Volcanes', '14440', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1671', 'El Mirador 1A Sección', '14449', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1672', 'El Mirador 2A Sección', '14449', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1673', 'El Mirador 3A Sección', '14449', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1674', 'Tlalpuente', '14460', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1675', 'Plan de Ayala', '14470', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1676', 'La Palma', '14476', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1677', 'Viveros Coatectlán', '14479', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1678', 'La Magdalena Petlacalco', '14480', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1679', 'San Miguel Xicalco', '14490', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1680', 'San Miguel Topilejo', '14500', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1681', 'Valle Escondido', '14600', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1682', 'Colinas del Bosque', '14608', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1683', 'Las Tórtolas', '14609', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1684', 'Arenal Tepepan', '14610', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1685', 'Club de Golf México', '14620', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1686', 'ISSFAM', '14620', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1687', 'San Buenaventura', '14629', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1688', 'Chimalcoyotl', '14630', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1689', 'Villa Tlalpan', '14630', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1690', 'San Pedro Mártir FOVISSSTE', '14639', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1691', 'Ejidos de San Pedro Mártir', '14640', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1692', 'Fuentes de Tepepan', '14643', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1693', 'Valle de Tepepan', '14646', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1694', 'Juventud Unida', '14647', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1695', 'Rinconada El Mirador', '14647', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1696', 'Movimiento Organizado de Tlalpan', '14647', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1697', 'San Pedro Mártir', '14650', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1698', 'Heróico Colegio Militar', '14653', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1699', 'Tlalmille', '14657', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1700', 'Mirador del Valle', '14658', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1701', 'María Esther Zuno de Echeverría', '14659', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1702', 'San Miguel Ajusco', '14700', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1703', 'Santo Tomas Ajusco', '14710', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1704', 'Belvedere Ajusco', '14720', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1705', 'Lomas de Cuilotepec', '14730', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1706', 'Vistas del Pedregal', '14737', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1707', 'Bosques del Pedregal', '14738', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1708', '2 de Octubre', '14739', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1709', 'Lomas de Padierna Sur', '14740', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1710', 'Mirador II', '14748', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1711', 'Mirador I', '14748', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1712', 'Chimilli', '14749', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1713', 'Héroes de 1910', '14760', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1714', 'Parres El Guarda', '14900', '12', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1715', 'General Ignacio Zaragoza', '15000', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1716', 'Valentín Gómez Farias', '15010', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1717', 'Puebla', '15020', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1718', 'Zona Centro', '15100', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1719', 'Candelaria de los Patos FOVISSSTE', '15120', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1720', 'Janitzio', '15200', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1721', 'Valle Gómez', '15210', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1722', 'Popular Rastro', '15220', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1723', 'Nicolás Bravo', '15220', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1724', 'Emilio Carranza', '15230', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1725', 'Michoacana', '15240', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1726', 'Ampliación Michoacana', '15250', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1727', 'Ampliación 20 de Noviembre', '15260', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1728', 'Morelos', '15270', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1729', 'Penitenciaria', '15280', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1730', '10 de Mayo', '15290', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1731', 'Emiliano Zapata', '15299', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1732', '20 de Noviembre', '15300', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1733', '5o Tramo 20 de Noviembre', '15309', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1734', 'Felipe Ángeles', '15310', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1735', 'Azteca', '15320', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1736', 'Tres Mosqueteros', '15330', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1737', 'Ampliación Venustiano Carranza', '15339', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1738', 'Venustiano Carranza', '15340', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1739', 'Ampliación Penitenciaria', '15350', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1740', 'Progresista', '15370', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1741', 'Escuela de Tiro', '15380', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1742', '7 de Julio', '15390', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1743', 'Romero Rubio', '15400', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1744', 'Simón Bolívar', '15410', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1745', 'Ampliación Simón Bolívar', '15420', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1746', 'Aquiles Serdán', '15430', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1747', '1° de Mayo', '15440', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1748', 'Damián Carmona', '15450', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1749', 'Revolución', '15460', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1750', 'Miguel Hidalgo', '15470', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1751', 'Moctezuma 1a Sección', '15500', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1752', 'Pensador Mexicano', '15510', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1753', 'Peñón de los Baños', '15520', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1754', 'Moctezuma 2a Sección', '15530', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1755', 'Santa Cruz Aviación', '15540', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1756', 'Arenal 1a Sección', '15600', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1757', 'Cuchilla Pantitlan', '15610', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1758', 'Caracol', '15630', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1759', 'Arenal Puerto Aéreo', '15640', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1760', 'Arenal 4a Sección', '15640', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1761', 'Ampliación Caracol', '15650', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1762', 'Arenal 3a Sección', '15660', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1763', 'Fivipor', '15669', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1764', 'Adolfo López Mateos', '15670', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1765', 'Arenal 2a Sección', '15680', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1766', 'Federal', '15700', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1767', 'Industrial Puerto Aéreo', '15710', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1768', 'Zaragoza Bahía', '15720', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1769', '4 Árboles', '15730', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1770', 'Aviación Civil', '15740', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1771', 'Ampliación Aviación Civil', '15750', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1772', 'Jamaica', '15800', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1773', 'Merced Balbuena', '15810', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1774', 'Lorenzo Boturini', '15820', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1775', 'Artes Graficas', '15830', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1776', 'Sevilla', '15840', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1777', 'Magdalena Mixiuhca', '15850', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1778', 'Pueblo de La Magdalena Mixiuhca', '15860', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1779', 'Aarón Sáenz', '15870', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1780', 'Jardín Balbuena', '15900', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1781', 'Morelos', '15940', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1782', 'Unidad Kennedy', '15950', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1783', 'Del Parque', '15960', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1784', 'Aeronáutica Militar', '15970', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1785', '24 de Abril', '15980', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1786', 'Álvaro Obregón', '15990', '17', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1787', 'Barrio San Juan', '16000', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1788', 'Barrio La Concepción Tlacoapa', '16000', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1789', 'Barrio San Antonio', '16000', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1790', 'Las Peritas', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1791', 'Misiones de La Noria', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1792', 'Bosque Residencial del Sur', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1793', 'San Bartolo El Chico', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1794', 'Arcos del Sur', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1795', 'Paseos del Sur', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1796', 'Aldama', '16010', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1797', 'Potreros de La Noria', '16019', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1798', 'San Juan Tepepan', '16020', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1799', 'Santa María Tepepan', '16020', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1800', 'Ampliación Tepepan', '16029', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1801', 'La Noria', '16030', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1802', 'Potrero de San Bernardino', '16030', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1803', 'Huichapan', '16030', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1804', 'División del Norte INFONAVIT', '16030', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1805', 'Barrio 18', '16034', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1806', 'Rinconada Coapa', '16035', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1807', 'San Lorenzo La Cebada', '16035', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1808', 'Ampliación San Marcos Norte', '16038', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1809', 'San Marcos', '16039', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1810', 'Barrio La Asunción', '16040', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1811', 'Barrio San Lorenzo', '16040', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1812', 'Jardines del Sur', '16050', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1813', 'Barrio San Marcos', '16050', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1814', 'Tierra Nueva', '16050', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1815', 'Xochimilco Corporación', '16057', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1816', 'Villa Xochimilco', '16058', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1817', 'Las Gárgolas', '16059', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1818', 'Rinconada del Sur', '16059', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1819', 'El Mirador', '16060', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1820', 'Barrio La Guadalupita', '16070', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1821', 'Barrio Santa Crucita', '16070', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1822', 'Barrio Belén', '16070', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1823', 'Barrio El Rosario', '16070', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1824', 'Barrio La Santísima', '16080', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1825', 'Barrio San Esteban', '16080', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1826', 'Barrio San Cristóbal', '16080', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1827', 'Barrio San Diego', '16080', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1828', 'Tablas de San Lorenzo', '16090', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1829', 'Barrio Xaltocan', '16090', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1830', 'Barrio San Pedro', '16090', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1831', 'Los Geranios', '16098', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1832', 'Nativitas INFONAVIT', '16099', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1833', 'Santa Cruz Xochitepec', '16100', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1834', 'Rinconada San Pablo', '16105', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1835', 'Santiago Tepalcatlalpan', '16200', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1836', 'La Concha', '16210', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1837', 'San Lucas Xochimanca', '16300', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1838', 'La Cañada', '16310', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1839', 'San Lucas Oriente', '16320', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1840', 'Loreto y Peña Pobre', '16330', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1841', 'Texmic', '16340', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1842', 'San Lorenzo Atemoaya', '16400', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1843', 'Lomas de Tonalco', '16410', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1844', 'San Jerónimo', '16420', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1845', 'El Jazmín', '16428', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1846', 'Rancho Tejomulco', '16429', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1847', 'Xochipilli', '16430', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1848', 'Año de Juárez', '16440', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1849', 'Barrio Pocitos', '16443', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1850', 'Santa María Nativitas', '16450', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1851', 'Lomas de Nativitas', '16457', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1852', 'Ampliación Nativitas', '16459', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1853', 'Barrio Apatlaco', '16513', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1854', 'Barrio del Puente', '16513', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1855', 'Barrio Tetitla', '16514', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1856', 'Barrio La Gallera', '16514', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1857', 'Barrio Calpulco', '16514', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1858', 'Barrio La Planta', '16520', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1859', 'Barrio Las Cruces', '16530', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1860', 'Barrio Las Flores', '16530', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1861', 'Barrio Ahualapa', '16533', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1862', 'Valle de Santa María', '16550', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1863', 'San Gregorio Atlapulco', '16600', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1864', 'Barrio San Andrés', '16604', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1865', 'Barrio Los Reyes', '16605', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1866', 'Barrio 3 de Mayo', '16606', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1867', 'Barrio San Antonio', '16607', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1868', 'Barrio La Candelaria', '16609', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1869', 'San Luis Tlaxialtemalco', '16610', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1870', 'Barrio Niños Héroes', '16614', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1871', 'Barrio La Asunción', '16615', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1872', 'Barrio Santa Cecilia', '16616', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1873', 'Barrio San Sebastián', '16617', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1874', 'Barrio San José', '16620', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1875', 'Barrio San Juan', '16629', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1876', 'Barrio La Guadalupana', '16629', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1877', 'Barrio San Juan Moyotepec', '16630', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1878', 'Barrio San Juan Minas', '16640', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1879', 'Quirino Mendoza', '16710', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1880', 'Del Carmen', '16720', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1881', 'San Isidro', '16739', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1882', 'Guadalupita', '16740', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1883', 'Las Animas', '16749', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1884', 'Barrio Calyequita', '16750', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1885', 'San Felipe', '16770', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1886', 'El Mirador', '16776', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1887', 'Santiaguito', '16776', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1888', 'Cerrillos Segunda Sección', '16780', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1889', 'Cerrillos Tercera Sección', '16780', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1890', 'Cerrillos Primera Sección', '16780', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1891', 'Cristo Rey', '16780', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1892', 'El Sacrificio', '16780', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1893', 'Nativitas', '16797', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1894', 'Las Mesitas', '16799', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1895', 'San Mateo Xalpa', '16800', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1896', 'San Andrés Ahuayucan', '16810', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1897', 'Rosario Tlali', '16810', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1898', 'Santa Inés', '16810', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1899', 'Barrio El Calvario', '16813', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1900', 'Santa Cruz Chavarrieta', '16840', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1901', 'Barrio Chapultepec', '16850', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1902', 'Santa Cruz de Guadalupe', '16860', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1903', 'Santa Cecilia Tepetlapa', '16880', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1904', 'San Francisco Tlalnepantla', '16900', '13', '1');
INSERT INTO "cat_colonia_cp" VALUES ('1905', 'Del Valle', '03010', '14', '1');


-- ----------------------------
-- Records of cat_reporte
-- ----------------------------
INSERT INTO "cat_reporte" VALUES ('1', 'Calles sin señalización', '1');
INSERT INTO "cat_reporte" VALUES ('2', 'Iluminación escasa', '1');
INSERT INTO "cat_reporte" VALUES ('3', 'Vías y banquetas deficientes', '1');
INSERT INTO "cat_reporte" VALUES ('4', 'Calles con obstáculos', '1');
INSERT INTO "cat_reporte" VALUES ('5', 'Paradas de transporte en mal estado', '1');
INSERT INTO "cat_reporte" VALUES ('6', 'Acceso al transporte en mal estado', '1');
INSERT INTO "cat_reporte" VALUES ('7', 'Pasos a desnivel y puentes peligrosos', '1');


-- ----------------------------
-- Records of cat_sensacion
-- ----------------------------
INSERT INTO "cat_sensacion" VALUES ('1', 'Asustada', '10', '1');
INSERT INTO "cat_sensacion" VALUES ('2', 'Incómoda', '10', '1');
INSERT INTO "cat_sensacion" VALUES ('3', 'Cómoda', '10', '1');


-- ----------------------------
-- Records of cat_opciones_acoso
-- ----------------------------
INSERT INTO "cat_opciones_acoso" VALUES ('1', 'Silbido', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('2', 'Comentarios indecentes', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('3', 'Fotografías o videos sin tu consentimiento', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('4', 'Miradas lascivas', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('5', 'Te cierran el paso', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('6', 'Exhibición de órganos sexuales', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('7', 'Propuestas sexuales', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('8', 'Persecución', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('9', 'Abuso sexual, tocamiento y/o manoseo', '10', '1');
INSERT INTO "cat_opciones_acoso" VALUES ('10', 'Violación', '10', '1');


-- ----------------------------
-- Records of cat_clasificacion_lugar
-- ----------------------------
INSERT INTO "cat_clasificacion_lugar" VALUES ('1', 'Vías y banquetas', '1');
INSERT INTO "cat_clasificacion_lugar" VALUES ('2', 'Iluminación', '1');
INSERT INTO "cat_clasificacion_lugar" VALUES ('3', 'Visibilidad', '1');
INSERT INTO "cat_clasificacion_lugar" VALUES ('4', 'Vigilancia', '1');
INSERT INTO "cat_clasificacion_lugar" VALUES ('5', 'Presencia de personas', '1');
INSERT INTO "cat_clasificacion_lugar" VALUES ('6', 'Transporte público', '1');
INSERT INTO "cat_clasificacion_lugar" VALUES ('7', 'Identifica riesgo', '1');


-- ----------------------------
-- Records of cat_opciones_lugar
-- ----------------------------
INSERT INTO "cat_opciones_lugar" VALUES ('1', '1', 'Nulas', 'No hay caminos o los hay en muy malas condiciones','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('2', '1', 'Escasa', 'Se puede caminar pero no correr','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('3', '1', 'Suficiente', 'Fácil para caminar rápido o correr','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('4', '2', 'Nula', 'No hay alumbrado público, ni de otro tipo','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('5', '2', 'Escasa', 'Pocas luces y visión con poca claridad','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('6', '2', 'Suficiente', 'Suficiente luz para ver claramente','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('7', '3', 'Cero visibilidad', 'No se ven los alrededores en el panorama general','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('8', '3', 'Parcialmente visible', 'Se puede ver un poco hacia adelante y alrededor','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('9', '3', 'Bastante visible', 'Se puede ver con claridad en todas las direcciones ','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('10', '4', 'Nula', 'No hay cámaras de seguridad ni policías alrededor','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('11', '4', 'Suficiente', 'Hay cámaras o personal de seguridad','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('12', '4', 'Excelente', 'Hay presencia de personal de seguridad y/o cámaras continua','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('13', '5', 'Nula', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('14', '5', 'Poca circulación de personas', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('15', '5', 'Solo presencia masculina', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('16', '5', 'Muchas personas (ambos sexos)', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('17', '6', 'Lejos', 'A 10 minutos caminando','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('18', '6', 'Cerca', 'A 5 minutos caminando','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('19', '6', 'Muy cerca', 'A 2 minutos caminando','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('20', '7', 'Robos', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('21', '7', 'Vandalismo', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('22', '7', 'Personas consumiendo drogas y alcohol en la calle', '','10', '1');
INSERT INTO "cat_opciones_lugar" VALUES ('23', '7', 'Robos en transporte público', '','10', '1');