-- ==============================================================================
-- Objetivo: Obtener la lista de alumnos inscritos en programas educativos
-- con estatus activo.
-- ==============================================================================
SELECT a.nombre AS alumno, p.nombre AS programa, e.estatus
FROM inscripciones AS i
JOIN alumnos AS a ON i.id_alumno = a.id_alumno
JOIN estatus AS e ON i.id_estatus = e.id_estatus
JOIN programas AS p ON i.id_programa = p.id_programa
WHERE i.id_estatus IN (1,6)
ORDER BY p.nombre, a.id_alumno
;

-- ==============================================================================
-- Objetivo: Obtener alumnos que tuvieron al menos un cambio de estatus
-- en los últimos 30 días.
-- ==============================================================================
-- Opcion 1: Muestra uno o más cambios del estatus de un alumno en los últimos 30 días
SELECT a.nombre,
	e_ant.estatus as estatus_anterior,
	e_act.estatus as estatus_actual,
	DATE_FORMAT(i.fecha_inscripcion, '%d/%m/%Y') AS fecha_inscripcion,
	DATE_FORMAT(H.fecha_cambio, '%d/%m/%Y') AS fecha_cambio,
	h.motivo
FROM inscripciones AS i
INNER JOIN alumnos AS a ON i.id_alumno = a.id_alumno
INNER JOIN historial_estatus AS h ON i.id_inscripcion = h.id_inscripcion
INNER JOIN estatus AS e_ant ON h.id_estatus_ant = e_ant.id_estatus
INNER JOIN estatus AS e_act ON h.id_estatus_act = e_act.id_estatus
WHERE fecha_cambio > DATE_SUB(NOW(), INTERVAL 31 DAY)
ORDER BY h.fecha_cambio DESC;

-- Opcion 2: Muestra el último cambio de estatus de un alumno en los últimos 30 días
SELECT a.nombre,
	e_ant.estatus as estatus_anterior,
	e_act.estatus as estatus_actual,
	DATE_FORMAT(i.fecha_inscripcion, '%d/%m/%Y') AS fecha_inscripcion,
	DATE_FORMAT(H.fecha_cambio, '%d/%m/%Y') AS fecha_cambio,
	h.motivo
FROM inscripciones AS i
INNER JOIN alumnos AS a ON i.id_alumno = a.id_alumno
INNER JOIN historial_estatus AS h ON i.id_inscripcion = h.id_inscripcion
INNER JOIN estatus AS e_ant ON h.id_estatus_ant = e_ant.id_estatus
INNER JOIN estatus AS e_act ON h.id_estatus_act = e_act.id_estatus
INNER JOIN (SELECT i2.id_alumno, MAX(he.fecha_cambio) AS fecha_cambio
				FROM inscripciones AS i2
				INNER JOIN historial_estatus AS he ON i2.id_inscripcion = he.id_inscripcion
				GROUP BY i2.id_alumno
	) AS ult_fech ON (a.id_alumno = ult_fech.id_alumno AND h.fecha_cambio = ult_fech.fecha_cambio)
WHERE h.fecha_cambio > DATE_SUB(NOW(), INTERVAL 31 DAY)
ORDER BY h.fecha_cambio DESC;

-- ==============================================================================
-- Objetivo: Obtener la tasa de baja por programa
-- ==============================================================================
SELECT p.nombre AS programa,
	COUNT(i.id_programa) as inscritos,
	CASE WHEN SUM(i.id_estatus IN (2,3,7)) IS NULL
		THEN 0 ELSE SUM(i.id_estatus IN (2,3,7))
	END AS bajas,
	CASE WHEN COUNT(i.id_programa) = 0 THEN 0
		ELSE ROUND((SUM(i.id_estatus IN (2,3,7)) * 100) / COUNT(i.id_programa), 2)
	END AS tasa_baja
FROM inscripciones AS i
RIGHT JOIN programas p ON i.id_programa = p.id_programa
GROUP BY p.id_programa
ORDER BY tasa_baja desc
;

-- ==============================================================================
-- Objetivo: Historial completo de un alumno específico
-- en este caso el alumno con id_alumno 1016
-- ==============================================================================
SELECT a.nombre, a.empresa,
	p.nombre AS programa,
	DATE_FORMAT(i.fecha_inscripcion, '%d/%m/%Y') AS fecha_inscripcion,
	e_ant.estatus as estatus_anterior,
	e_act.estatus as estatus_actual,
	DATE_FORMAT(H.fecha_cambio, '%d/%m/%Y') AS fecha_cambio,
	h.motivo
FROM inscripciones AS i
INNER JOIN alumnos AS a ON i.id_alumno = a.id_alumno
INNER JOIN programas AS p ON i.id_programa = p.id_programa
INNER JOIN historial_estatus AS h ON i.id_inscripcion = h.id_inscripcion
INNER JOIN estatus AS e_ant ON h.id_estatus_ant = e_ant.id_estatus
INNER JOIN estatus AS e_act ON h.id_estatus_act = e_act.id_estatus
WHERE a.id_alumno = 1016
ORDER BY h.fecha_cambio DESC;

-- ==============================================================================
-- Objetivo: Alumnos que pasaron de baja_empresa (estatus = 2) a activo (estatus = 6)
-- ==============================================================================
SELECT a.nombre, a.empresa,
	e_ant.estatus as estatus_anterior,
	e_act.estatus as estatus_actual,
	p.nombre AS programa,
	DATE_FORMAT(i.fecha_inscripcion, '%d/%m/%Y') AS fecha_inscripcion,
	DATE_FORMAT(H.fecha_cambio, '%d/%m/%Y') AS fecha_cambio,
	h.motivo
FROM inscripciones AS i
INNER JOIN alumnos AS a ON i.id_alumno = a.id_alumno
INNER JOIN programas AS p ON i.id_programa = p.id_programa
INNER JOIN historial_estatus AS h ON i.id_inscripcion = h.id_inscripcion
INNER JOIN estatus AS e_ant ON h.id_estatus_ant = e_ant.id_estatus
INNER JOIN estatus AS e_act ON h.id_estatus_act = e_act.id_estatus
WHERE h.id_estatus_ant = 2 AND h.id_estatus_act = 6
ORDER BY h.fecha_cambio DESC;
