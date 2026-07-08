import express, { json } from 'express'
import cors  from 'cors'
import 'dotenv/config'
import { ACCEPTED_ORIGINS } from './middlewares/cors.js'
import { estatusRouter } from './routers/estatus.js'
import { programasRouter } from './routers/programas.js'
import { alumnosRouter } from './routers/alumnos.js'
import { pool } from './config/mariadb.js'

const app = express()

app.use(json())
app.use(cors(ACCEPTED_ORIGINS))
app.disable('x-powered-by')

app.use('/estatus', estatusRouter())
app.use('/programas', programasRouter())
app.use('/alumnos', alumnosRouter())

const PORT = process.env.PORT || 1234

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`)
})