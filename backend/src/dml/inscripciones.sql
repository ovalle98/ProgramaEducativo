-- =============================================================================
-- Insertar datos en la tabla "inscripciones"
-- Descripción: Inserta registros de inscripción para los alumnos.
-- =============================================================================

INSERT INTO inscripciones (id_alumno, id_programa, id_estatus, fecha_inscripcion) VALUES
(1001, 7, 5, STR_TO_DATE('26/02/2025', '%d/%m/%Y')),
(1002, 4, 5, STR_TO_DATE('04/10/2022', '%d/%m/%Y')),
(1003, 5, 5, STR_TO_DATE('02/10/2017', '%d/%m/%Y')),
(1004, 5, 5, STR_TO_DATE('06/06/2015', '%d/%m/%Y')),
(1005, 5, 5, STR_TO_DATE('31/03/2017', '%d/%m/%Y')),
(1006, 10, 5, STR_TO_DATE('28/03/2023', '%d/%m/%Y')),
(1007, 7, 5, STR_TO_DATE('30/03/2024', '%d/%m/%Y')),
(1008, 7, 5, STR_TO_DATE('05/07/2018', '%d/%m/%Y')),
(1009, 5, 5, STR_TO_DATE('01/06/2017', '%d/%m/%Y')),
(1010, 5, 5, STR_TO_DATE('04/11/2020', '%d/%m/%Y')),
(1011, 3, 5, STR_TO_DATE('14/10/2017', '%d/%m/%Y')),
(1012, 4, 5, STR_TO_DATE('06/05/2022', '%d/%m/%Y')),
(1013, 7, 5, STR_TO_DATE('26/02/2020', '%d/%m/%Y')),
(1014, 5, 5, STR_TO_DATE('29/10/2024', '%d/%m/%Y')),
(1015, 5, 5, STR_TO_DATE('01/07/2015', '%d/%m/%Y')),
(1016, 9, 5, STR_TO_DATE('05/12/2022', '%d/%m/%Y')),
(1017, 5, 5, STR_TO_DATE('29/12/2017', '%d/%m/%Y')),
(1018, 7, 5, STR_TO_DATE('28/03/2022', '%d/%m/%Y')),
(1019, 8, 5, STR_TO_DATE('14/09/2016', '%d/%m/%Y')),
(1020, 5, 5, STR_TO_DATE('31/03/2015', '%d/%m/%Y'));
COMMIT;