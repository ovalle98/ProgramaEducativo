-- ==============================================================================
-- Objetivo: Obtener la lista de alumnos inscritos en programas educativos
-- con estatus activo.
-- ==============================================================================

SELECT a.id_alumno AS id_alumno, a.nombre AS alumno, p.nombre AS programa,e.estatus
FROM inscripciones AS i
JOIN alumnos AS a ON i.id_alumno = a.id_alumno
JOIN estatus AS e ON i.id_estatus = e.id_estatus
JOIN programas AS p ON i.id_programa = p.id_programa
WHERE i.id_estatus = 1
ORDER BY a.nombre, a.id_alumno
;

-- ==============================================================================
-- Objetivo: Obtener alumnos que tuvieron al menos un cambio de estatus
-- en los últimos 30 días.
-- ==============================================================================
SELECT DISTINCT a.id_alumno, a.nombre,
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
ORDER BY a.id_alumno, h.fecha_cambio DESC;


-- ==============================================================================
-- Objetivo: Obtener la tasa de baja por programa
-- ==============================================================================
WITH
tot_inscritos AS (
	SELECT COUNT(id_inscripcion) total_inscritos
	FROM inscripciones
),
tot_bajas AS (
	SELECT p.nombre programa, COUNT(i.id_estatus) AS total_bajas
   FROM programas AS p
   LEFT JOIN inscripciones AS i
		ON  (p.id_programa = i.id_programa AND i.id_estatus IN (2, 3))
   GROUP BY p.id_programa
)
SELECT programa, total_bajas, total_inscritos, ROUND((total_bajas * 100) / total_inscritos,2) AS promedio_bajas
FROM tot_bajas
CROSS JOIN tot_inscritos
;

-- ==============================================================================
-- Objetivo: Historial completo de un alumno específico
-- en este caso el alumno con id_alumno 1106
-- ==============================================================================
----Opcion 1 con IDs y nombres
SELECT a.id_alumno, a.nombre, a.empresa,
	p.id_programa, p.nombre AS programa,
	i.id_inscripcion,
	DATE_FORMAT(i.fecha_inscripcion, '%d/%m/%Y') AS fecha_inscripcion,
	h.id_estatus_ant AS id_estatus_anterior, e_ant.estatus as estatus_anterior,
	h.id_estatus_act AS id_estatus_acctual, e_act.estatus as estatus_actual,
	DATE_FORMAT(H.fecha_cambio, '%d/%m/%Y') AS fecha_cambio,
	h.motivo
FROM inscripciones AS i
INNER JOIN alumnos AS a ON i.id_alumno = a.id_alumno
INNER JOIN programas AS p ON i.id_programa = p.id_programa
INNER JOIN historial_estatus AS h ON i.id_inscripcion = h.id_inscripcion
INNER JOIN estatus AS e_ant ON h.id_estatus_ant = e_ant.id_estatus
INNER JOIN estatus AS e_act ON h.id_estatus_act = e_act.id_estatus
WHERE a.id_alumno = 1106
ORDER BY h.fecha_cambio DESC;

-- Opcion 2 con nombres
SELECT a.id_alumno, a.nombre, a.empresa,
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
WHERE a.id_alumno = 1106
ORDER BY h.fecha_cambio DESC;

-- ==============================================================================
-- Objetivo: Alumnos que pasaron de baja_empresa (estatus = 2) a activo (estatus = 6)
-- ==============================================================================
--Opcion 1 con IDs y nombres
SELECT a.id_alumno, a.nombre, a.empresa,
	h.id_estatus_ant AS id_estatus_anterior, e_ant.estatus as estatus_anterior,
	h.id_estatus_act AS id_estatus_acctual, e_act.estatus as estatus_actual,
	p.id_programa, p.nombre AS programa,
	i.id_inscripcion,
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

-- Opcion 2 con nombres
SELECT a.id_alumno, a.nombre, a.empresa,
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



