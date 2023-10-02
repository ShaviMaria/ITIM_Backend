import express, { Application } from 'express'
import morgan from 'morgan'

//Import Routes
import usersRouter from './routes/users.routes'

const app: Application = express()

//Settings
app.set('port', 4000)

//Middlewares
app.use(morgan('dev'))
app.use(express.json())
app.use((_req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});

//Routes
app.use('/api/Users', usersRouter)

export default app