import { Router } from 'express'
import { methods as usersController } from '../controllers/users.controller'

const router: Router = Router()

router.post('/SignIn', usersController.signIn)

export default router