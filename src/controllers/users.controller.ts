import { Request, Response } from 'express'
import { Connection } from 'promise-mysql'
import { getConnection } from '../database/database'

const signUp = async (req: Request, res: Response): Promise<void> => {
    try {
        const connection: Connection = await getConnection()
    } catch(error: any) {
        console.error(error.message)
        res.status(500).json({ message: 'Internal error' })
    }
}

export const methods: Object = {

}