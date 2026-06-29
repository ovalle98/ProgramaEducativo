-- ==============================================================================
-- Procedure para actualizar el estatus de un alumno en la tabla inscripciones y
-- registrar el cambio en la tabla historial_estatus
-- ==============================================================================

DROP PROCEDURE IF EXISTS prc_update_estatus;

DELIMITER //
CREATE PROCEDURE IF NOT EXISTS prc_update_estatus (
	IN inscripcion INT,
	IN nuevo_estatus INT,
	IN motivo_cambio VARCHAR(200)
)

BEGIN
--  Verificar si el id_inscripcion y el nuevo_estatus existen en sus perspectivos catalogos
	IF NOT EXISTS
		(SELECT id_inscripcion FROM inscripciones WHERE id_inscripcion = inscripcion) THEN
     		SELECT 'No exixste el id_inscripcion' AS error;
	ELSEIF NOT EXISTS
		(SELECT id_estatus FROM inscripciones WHERE id_estatus = nuevo_estatus) THEN
			SELECT 'No exixste el nuevo_estatus' AS error;
   ELSE
   	INSERT INTO historial_estatus (id_inscripcion, id_estatus_ant, id_estatus_act, fecha_cambio, motivo)
		SELECT inscripcion AS id_inscripcion,
			id_estatus AS id_estatus_ant,
			nuevo_estatus AS id_estatus_act,
			CURRENT_DATE fecha_cambio,
			motivo_cambio AS motivo
		FROM inscripciones
		WHERE id_inscripcion = inscripcion;

--  Actualiza el nuevo estatus en la tabla inscripciones
		UPDATE inscripciones SET id_estatus = nuevo_estatus WHERE id_inscripcion = inscripcion;
		COMMIT;

		SELECT 'Estatus actualizado' msg;
   END IF;
END; //
DELIMITER ;


-- Llammar el procedimiento para actualizar el estatus de un alumno
CALL prc_update_estatus(1, 6, 'Resolvio sus problemas');
