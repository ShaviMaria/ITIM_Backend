import { Request, Response } from 'express'
import { Connection } from 'promise-mysql'
import { getConnection } from '../database/database'
import ISystemUser from '../models/systemUser'
import jwt from 'jsonwebtoken'
import envData from '../config'

const signUp = async (req: Request, res: Response): Promise<void> => {
    try {
        if(!req.body.user) {
            res.status(401).json({ message: 'Request error: please add a user property to body' })
            return
        }

        if(!req.body.password) {
            res.status(401).json({ message: 'Request error: please add a password property to body' })
            return
        }

        const user: ISystemUser = {
            user: req.body.user,
            password: req.body.password
        }

        const connection: Connection = await getConnection()
        const query: string = `SELECT * FROM System_Users WHERE User_Code = "${user.user}" AND Password = "${user.password}"`

        const result = await connection.query(query)

        if(result.length > 0) {
            const payload: ISystemUser = result[0]
            const token = jwt.sign(payload, envData.secret_token_word, { expiresIn: '2h'})
            res.send({
                message: 'SingUp Successfully',
                token
            })
        } else {
            res.status(401).json({ message: 'Error: User or Password incorrect' })
            return
        }

    } catch(error: any) {
        console.error(error.message)
        res.status(500).json({ message: 'Internal error' })
    }
}

export const methods = {
    signUp
}