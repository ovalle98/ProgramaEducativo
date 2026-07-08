import {Router} from 'express'
import { pool } from '../config/mariadb.js'

export const programasRouter = () => {
    const routerProgramas = Router()

    routerProgramas.get('/', async (req, res) => {
        try {
            const sql = 'SELECT id_programa, nombre FROM programas'
            const programas = await pool.query(sql)
            return res.send(programas)
        } catch (error) {
            console.error('Error al obtener los programas:', error)
            res.status(500).send('Error al obtener los programas')
        }
    })

    return routerProgramas
}