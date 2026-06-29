-- =============================================================================
-- Insertar datos en la tabla "alumnos"
-- Descripción: Inserta registros de ejemplo en la tabla "alumnos" para pruebas y demostraciones.
-- =============================================================================

INSERT INTO alumnos (id_alumno, nombre, empresa, fecha_ingreso) VALUES
(1001, 'Luis Cruz', 'Soriana', STR_TO_DATE('26/02/2025', '%d/%m/%Y')),
(1002, 'Andrés Ramírez', 'Coppel', STR_TO_DATE('04/10/2022', '%d/%m/%Y')),
(1003, 'Daniela Ortiz', 'Soriana', STR_TO_DATE('02/10/2017', '%d/%m/%Y')),
(1004, 'Luis Reyes', 'Soriana', STR_TO_DATE('06/06/2015', '%d/%m/%Y')),
(1005, 'Sofía Hernández', 'Soriana', STR_TO_DATE('31/03/2017', '%d/%m/%Y')),
(1006, 'Paola Mendoza', 'Bayer', STR_TO_DATE('28/03/2023', '%d/%m/%Y')),
(1007, 'Gabriela Cruz', 'Soriana', STR_TO_DATE('30/03/2024', '%d/%m/%Y')),
(1008, 'Gabriela Morales', 'Soriana', STR_TO_DATE('05/07/2018', '%d/%m/%Y')),
(1009, 'Paola López', 'Soriana', STR_TO_DATE('01/06/2017', '%d/%m/%Y')),
(1010, 'Valeria Torres', 'Soriana', STR_TO_DATE('04/11/2020', '%d/%m/%Y')),
(1011, 'Paola Sánchez', 'Alpura', STR_TO_DATE('14/10/2017', '%d/%m/%Y')),
(1012, 'José Gutiérrez', 'Coppel', STR_TO_DATE('06/05/2022', '%d/%m/%Y')),
(1013, 'Diego Jiménez', 'Soriana', STR_TO_DATE('26/02/2020', '%d/%m/%Y')),
(1014, 'Daniela Morales', 'Soriana', STR_TO_DATE('29/10/2024', '%d/%m/%Y')),
(1015, 'Paola Ramírez', 'Soriana', STR_TO_DATE('01/07/2015', '%d/%m/%Y')),
(1016, 'Jorge Rodríguez', 'Coppel', STR_TO_DATE('05/12/2022', '%d/%m/%Y')),
(1017, 'Luis Flores', 'Soriana', STR_TO_DATE('29/12/2017', '%d/%m/%Y')),
(1018, 'Roberto Hernández', 'Soriana', STR_TO_DATE('28/03/2022', '%d/%m/%Y')),
(1019, 'Roberto Morales', 'Bayer', STR_TO_DATE('14/09/2016', '%d/%m/%Y')),
(1020, 'Carlos Jiménez', 'Soriana', STR_TO_DATE('31/03/2015', '%d/%m/%Y'));
COMMIT;