-- =======================================================
-- Objetivo: Obtener la tasa de egresados por programa
-- =======================================================

SELECT p.nombre AS programa,
	COUNT(i.id_programa) as inscritos,
	CASE WHEN SUM(i.id_estatus = 4) IS NULL
		THEN 0 ELSE SUM(i.id_estatus = 4)
	END AS egresados,
	CASE WHEN COUNT(i.id_programa) = 0 THEN 0
		ELSE ROUND((SUM(i.id_estatus = 4) * 100) / COUNT(i.id_programa), 2)
	END AS tasa_egresados
FROM inscripciones AS i
RIGHT JOIN programas p ON i.id_programa = p.id_programa
GROUP BY p.id_programa
ORDER BY tasa_egresados desc
;