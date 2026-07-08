import mariadb from 'mariadb'
import 'dotenv/config'

export const pool = mariadb.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || 'root',
    database: process.env.DB_NAME || 'db_programa_educativo',
    port: process.env.DB_PORT || 3306
})




