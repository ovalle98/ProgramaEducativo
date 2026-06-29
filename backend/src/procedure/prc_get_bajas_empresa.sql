-- ==============================================================================
-- Procedure para obtener el conteo de bajas por programa de la empresa
-- ==============================================================================

DROP PROCEDURE IF EXISTS prc_get_bajas_empresa;

DELIMITER //
CREATE PROCEDURE IF NOT EXISTS prc_get_bajas_empresa (
	IN v_empresa VARCHAR(200)
)

BEGIN
	SELECT a.empresa, SUM(i.id_estatus = 3) AS total_bajas_programa 
	FROM inscripciones AS i
	JOIN alumnos AS a ON i.id_alumno = a.id_alumno AND a.empresa = v_empresa
	GROUP BY a.empresa
	;
END; //
DELIMITER ;

CALL prc_get_bajas_empresa('Soriana');
