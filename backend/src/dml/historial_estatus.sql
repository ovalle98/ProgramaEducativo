-- =============================================================================
-- Insertar datos en la tabla "historial_estatus"
-- Descripción: Inserta registros de cambios de estatus para los alumnos.
-- =============================================================================


-- 1) Insertar alumnos que ingresaron y se cambio el estatus al activo
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(1, 5, 1, STR_TO_DATE('26/02/2025', '%d/%m/%Y'), 'Inscripcion al programa'),
(2, 5, 1, STR_TO_DATE('04/10/2022', '%d/%m/%Y'), 'Inscripcion al programa'),
(3, 5, 1, STR_TO_DATE('02/10/2017', '%d/%m/%Y'), 'Inscripcion al programa'),
(4, 5, 1, STR_TO_DATE('06/06/2015', '%d/%m/%Y'), 'Inscripcion al programa'),
(5, 5, 1, STR_TO_DATE('31/03/2017', '%d/%m/%Y'), 'Inscripcion al programa'),
(6, 5, 1, STR_TO_DATE('28/03/2023', '%d/%m/%Y'), 'Inscripcion al programa'),
(7, 5, 1, STR_TO_DATE('30/03/2024', '%d/%m/%Y'), 'Inscripcion al programa'),
(8, 5, 1, STR_TO_DATE('05/07/2018', '%d/%m/%Y'), 'Inscripcion al programa'),
(9, 5, 1, STR_TO_DATE('01/06/2017', '%d/%m/%Y'), 'Inscripcion al programa'),
(10, 5, 1, STR_TO_DATE('04/11/2020', '%d/%m/%Y'), 'Inscripcion al programa'),
(11, 5, 1, STR_TO_DATE('14/10/2017', '%d/%m/%Y'), 'Inscripcion al programa'),
(12, 5, 1, STR_TO_DATE('06/05/2022', '%d/%m/%Y'), 'Inscripcion al programa'),
(13, 5, 1, STR_TO_DATE('26/02/2020', '%d/%m/%Y'), 'Inscripcion al programa'),
(14, 5, 1, STR_TO_DATE('29/10/2024', '%d/%m/%Y'), 'Inscripcion al programa'),
(15, 5, 1, STR_TO_DATE('01/07/2015', '%d/%m/%Y'), 'Inscripcion al programa'),
(16, 5, 1, STR_TO_DATE('05/12/2022', '%d/%m/%Y'), 'Inscripcion al programa'),
(17, 5, 1, STR_TO_DATE('29/12/2017', '%d/%m/%Y'), 'Inscripcion al programa'),
(18, 5, 1, STR_TO_DATE('28/03/2022', '%d/%m/%Y'), 'Inscripcion al programa'),
(19, 5, 1, STR_TO_DATE('14/09/2016', '%d/%m/%Y'), 'Inscripcion al programa'),
(20, 5, 1, STR_TO_DATE('31/03/2015', '%d/%m/%Y'), 'Inscripcion al programa');
COMMIT;

-- 2) Insertar alumnos que se dieron de baja por despidos de la empresa
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(2, 1, 2, STR_TO_DATE('04/06/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(12, 1, 2, STR_TO_DATE('30/05/2026', '%d/%m/%Y'), 'Despidos de la empresa');
COMMIT;

-- 3) Insertar alumnos que se dieron de baja del programa por falta de interes
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(3, 1, 3, STR_TO_DATE('25/06/2026', '%d/%m/%Y'), 'Falta de interes en el programa'),
(13, 1, 3, STR_TO_DATE('10/05/2026', '%d/%m/%Y'), 'Falta de interes en el programa');
COMMIT;

-- 4) Insertar alumnos que egresaron del programa
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(4, 1, 4, STR_TO_DATE('31/05/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(8, 1, 4, STR_TO_DATE('31/05/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(9, 1, 4, STR_TO_DATE('31/05/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(14, 1, 4, STR_TO_DATE('28/05/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(18, 1, 4, STR_TO_DATE('28/05/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(19, 1, 4, STR_TO_DATE('28/05/2026', '%d/%m/%Y'), 'Finalizaron el programa');
COMMIT;


-- 5) Insertar alumnos que se dieron de baja, regresaron y se egresaron del programa
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(5, 1, 2, STR_TO_DATE('20/05/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(10, 1, 2, STR_TO_DATE('31/05/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(15, 1, 3, STR_TO_DATE('09/06/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(20, 1, 2, STR_TO_DATE('28/05/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(5, 2, 6, STR_TO_DATE('09/06/2026', '%d/%m/%Y'), 'Reingreso al programa'),
(10, 2, 6, STR_TO_DATE('09/06/2026', '%d/%m/%Y'), 'Reingreso al programa'),
(15, 3, 6, STR_TO_DATE('19/06/2026', '%d/%m/%Y'), 'Reingreso al programa'),
(20, 2, 6, STR_TO_DATE('19/06/2026', '%d/%m/%Y'), 'Reingreso al programa'),
(5, 6, 4, STR_TO_DATE('19/06/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(10, 6, 4, STR_TO_DATE('19/06/2026', '%d/%m/%Y'), 'Finalizaron el programa'),
(15, 6, 4, STR_TO_DATE('24/06/2026', '%d/%m/%Y'), 'Finalizaron el programa');
COMMIT;

-- 6) Insertar alumnos que se dieron de baja Y regresaron
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(6, 1, 3, STR_TO_DATE('30/04/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(16, 1, 3, STR_TO_DATE('27/05/2026', '%d/%m/%Y'), 'Despidos de la empresa'),
(6, 3, 6, STR_TO_DATE('30/05/2026', '%d/%m/%Y'), 'Reingreso al programa'),
(16, 3, 6, STR_TO_DATE('30/05/2026', '%d/%m/%Y'), 'Reingreso al programa');
COMMIT;

-- 7) Insertar alumnos que fueron suspendidos
INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo) VALUES
(7, 1, 7, STR_TO_DATE('25/05/2026', '%d/%m/%Y'), 'Suspendido por falta de pago'),
(17, 1, 7, STR_TO_DATE('31/03/2026', '%d/%m/%Y'), 'Suspendido por falta de pago');
COMMIT;

-- Update estatus al valor actual en la tabla inscripciones
UPDATE inscripciones SET id_estatus = 1 WHERE id_inscripcion = 1;
UPDATE inscripciones SET id_estatus = 2 WHERE id_inscripcion = 2;
UPDATE inscripciones SET id_estatus = 3 WHERE id_inscripcion = 3;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 4;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 5;
UPDATE inscripciones SET id_estatus = 6 WHERE id_inscripcion = 6;
UPDATE inscripciones SET id_estatus = 7 WHERE id_inscripcion = 7;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 8;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 9;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 10;
UPDATE inscripciones SET id_estatus = 1 WHERE id_inscripcion = 11;
UPDATE inscripciones SET id_estatus = 2 WHERE id_inscripcion = 12;
UPDATE inscripciones SET id_estatus = 3 WHERE id_inscripcion = 13;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 14;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 15;
UPDATE inscripciones SET id_estatus = 6 WHERE id_inscripcion = 16;
UPDATE inscripciones SET id_estatus = 7 WHERE id_inscripcion = 17;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 18;
UPDATE inscripciones SET id_estatus = 4 WHERE id_inscripcion = 19;
UPDATE inscripciones SET id_estatus = 6 WHERE id_inscripcion = 20;
COMMIT;