-- =============================================================================
-- Insertar datos en la tabla "estatus"
-- Descripción: Inserta el catalogo de estatus para los alumnos.
-- =============================================================================

INSERT INTO estatus (estatus) VALUES
('Activo'),
('Baja de empresa'),
('Baja del programa'),
('Egresado'),
('Inscrito'),
('Reingreso'),
('Suspendido');

COMMIT;