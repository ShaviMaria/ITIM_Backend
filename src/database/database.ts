import mysql, { Connection } from 'promise-mysql'
import envData from '../config'

const connection = mysql.createConnection({
    host: envData.host,
    database: envData.database,
    user: envData.user,
    password: envData.password
})

export const getConnection = (): Promise<Connection> => {
    return connection
}