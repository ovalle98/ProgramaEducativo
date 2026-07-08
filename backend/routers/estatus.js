import {Router} from 'express'
import { pool } from '../config/mariadb.js'

export const estatusRouter = () => {
    const routerEstatus = Router()

    routerEstatus.get('/', async (req, res) => {
        try {
            const sql = 'SELECT id_estatus, estatus FROM estatus'
            const estatus = await pool.query(sql)
            return res.send(estatus)
        } catch (error) {
            res.status(500).send('Error al obtener los estatus')
        }
    })

    return routerEstatus
}