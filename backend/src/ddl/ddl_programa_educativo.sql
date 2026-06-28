-- =============================================================================
-- SISTEMA DE GESTIÓN DE PROGRAMAS EDUCATIVOS
-- DDL (Data Definition Language) del sistema de gestión de programas educativos.
-- Base de datos: mariaDB
-- Charset: utf8mb4 | Collation: utf8mb4_unicode_ci
-- =============================================================================

DROP DATABASE IF EXISTS db_programa_educativo;
CREATE DATABASE db_programa_educativo;

ALTER DATABASE db_programa_educativo
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE db_programa_educativo;

-- =============================================================================
-- DROP TABLES
-- =============================================================================
-- DROP TABLE IF EXISTS historial_estatus;
-- DROP TABLE IF EXISTS inscripciones;
-- DROP TABLE IF EXISTS alumnos;
-- DROP TABLE IF EXISTS programas;
-- DROP TABLE IF EXISTS estatus;

-- =============================================================================
-- TABLA: alumnos
-- Descripción: Contiene información de los alumnos dados de alta en el sistema
-- =============================================================================

CREATE TABLE IF NOT EXISTS alumnos (
	id_alumno INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(200) NOT NULL,
	empresa VARCHAR(100) NOT NULL,
	fecha_ingreso DATE NOT NULL DEFAULT (CURRENT_DATE),
	PRIMARY KEY (id_alumno)
);

-- =============================================================================
-- TABLA: programas
-- Descripción: Catalgo de programas educativos disponibles para los alumnos.
-- =============================================================================

CREATE TABLE IF NOT EXISTS programas (
	id_programa INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(200) NOT NULL,
	PRIMARY KEY (id_programa),
	CONSTRAINT UQ_PROGRAMAS_NOMBRE UNIQUE (nombre)
);

-- =============================================================================
-- TABLA: estatus
-- Descripción: Catalogo de estatus que puede tener un alumno en un programa educativo.
-- =============================================================================
CREATE TABLE IF NOT EXISTS estatus (
	id_estatus INT UNSIGNED NOT NULL AUTO_INCREMENT,
	estatus VARCHAR(200) NOT NULL,
	PRIMARY KEY (id_estatus),
	CONSTRAINT UQ_ESTATUS UNIQUE (estatus)
);

-- =============================================================================
-- TABLA: inscripciones
-- Descripción: Contiene información de las inscripciones de los alumnos a los programas educativos.
-- =============================================================================
CREATE TABLE IF NOT EXISTS inscripciones (
	id_inscripcion INT UNSIGNED NOT NULL AUTO_INCREMENT,
	id_alumno INT UNSIGNED NOT NULL,
	id_programa INT UNSIGNED NOT NULL,
	id_estatus INT UNSIGNED NOT NULL,
	fecha_inscripcion DATE NOT NULL DEFAULT (CURRENT_DATE),
	PRIMARY KEY (id_inscripcion),
	CONSTRAINT FK_INSCRIPCIONES_IDALUMNO FOREIGN KEY (id_alumno)
		REFERENCES alumnos (id_alumno) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_INSCRIPCIONES_IDPROGRAMA FOREIGN KEY (id_programa)
		REFERENCES programas (id_programa) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_INSCRIPCIONES_IDESTATUS FOREIGN KEY (id_estatus)
		REFERENCES estatus (id_estatus) ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- =============================================================================
-- TABLA: historial_estatus
-- Descripción: Contiene el historial de cambios en el estatus de las inscripciones con su perspectivo motivo.
-- =============================================================================
CREATE TABLE IF NOT EXISTS historial_estatus (
	id_historial INT UNSIGNED NOT NULL AUTO_INCREMENT,
	id_inscripcion INT UNSIGNED NOT NULL,
	id_estatus_ant INT UNSIGNED NOT NULL,
	id_estatus_act INT UNSIGNED NOT NULL,
	fecha_cambio DATE NOT NULL DEFAULT (CURRENT_DATE),
	motivo VARCHAR(200) NOT NULL,
	PRIMARY KEY (id_historial),
	CONSTRAINT FK_HISTORIAL_IDINSCRIPCION FOREIGN KEY (id_inscripcion)
		REFERENCES inscripciones (id_inscripcion) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_HISTORIAL_IDESTATUSANT FOREIGN KEY (id_estatus_ant)
		REFERENCES estatus (id_estatus) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_HISTORIAL_IDESTATUSACT FOREIGN KEY (id_estatus_act)
		REFERENCES estatus (id_estatus) ON UPDATE RESTRICT ON DELETE RESTRICT
);
