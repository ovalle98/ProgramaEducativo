import {Router} from 'express'
import { pool } from '../config/mariadb.js'

export const alumnosRouter = () => {
    const routerAlumnos = Router()

    routerAlumnos.get('/', async (req, res) => {
        try {
            const {id_programa, id_estatus, nombre} = req.query

            const nom_alum =  nombre ? `%${nombre}%` : `%_%`

            if(id_programa && id_estatus)  {
                const sql = 'SELECT a.id_alumno, a.nombre, a.empresa, p.id_programa, p.nombre AS programa, e.id_estatus, e.estatus '
                    + 'FROM alumnos AS a '
                    + 'INNER JOIN inscripciones AS i ON a.id_alumno = i.id_alumno '
                    + 'INNER JOIN programas AS p ON i.id_programa = p.id_programa and p.id_programa = ? '
                    + 'INNER JOIN estatus AS e  ON i.id_estatus = e.id_estatus and e.id_estatus = ? '
                    + 'WHERE UPPER(a.nombre) LIKE ? '

                const alumnos = await pool.query(sql,[id_programa, id_estatus, nom_alum])

                return res.send(alumnos)
            }

            if(id_programa) {
                const sql = 'SELECT a.id_alumno, a.nombre, a.empresa, p.id_programa, p.nombre AS programa, e.id_estatus, e.estatus '
                    + 'FROM alumnos AS a '
                    + 'INNER JOIN inscripciones AS i ON a.id_alumno = i.id_alumno '
                    + 'INNER JOIN programas AS p ON i.id_programa = p.id_programa and p.id_programa = ? '
                    + 'INNER JOIN estatus AS e  ON i.id_estatus = e.id_estatus '
                    + 'WHERE UPPER(a.nombre) LIKE ? '
                const alumnos = await pool.query(sql,[id_programa, nom_alum])
                return res.send(alumnos)
            }
            else if(id_estatus) {
                const sql = 'SELECT a.id_alumno, a.nombre, a.empresa, p.id_programa, p.nombre AS programa, e.id_estatus, e.estatus '
                    + 'FROM alumnos AS a '
                    + 'INNER JOIN inscripciones AS i ON a.id_alumno = i.id_alumno '
                    + 'INNER JOIN programas AS p ON i.id_programa = p.id_programa '
                    + 'INNER JOIN estatus AS e  ON i.id_estatus = e.id_estatus and e.id_estatus = ? '
                    + 'WHERE UPPER(a.nombre) LIKE ? '
                const alumnos = await pool.query(sql,[id_estatus, nom_alum])
                return res.send(alumnos)
            }
            const sql = 'SELECT a.id_alumno, a.nombre, a.empresa, p.id_programa, p.nombre AS programa, e.id_estatus, e.estatus '
                + 'FROM alumnos AS a '
                + 'INNER JOIN inscripciones AS i ON a.id_alumno = i.id_alumno '
                + 'INNER JOIN programas AS p ON i.id_programa = p.id_programa '
                + 'INNER JOIN estatus AS e  ON i.id_estatus = e.id_estatus '
                + 'WHERE UPPER(a.nombre) LIKE ? '
            const alumnos = await pool.query(sql,[nom_alum])
            return res.send(alumnos)
        } catch (error) {
            res.status(500).send('Error al obtener los alumnos')
        }
    })

    return routerAlumnos
}