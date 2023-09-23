import { config } from 'dotenv'

config()

interface IEnvData {
    host: string
    database: string
    user: string
    password: string
    secret_token_word: string
}

const envData: IEnvData = {
    host: process.env.HOST || "",
    database: process.env.DATABASE || "",
    user: process.env.UUSER || "",
    password: process.env.PASSWORD || "",
    secret_token_word: process.env.SECRET_WORD_PASSWORD || ""
}

if (envData.host === "") {
    throw new Error("Error: .env file don't have a HOST property")
}

if (envData.database === "") {
    throw new Error("Error: .env file don't have a DATABASE property")
}

if (envData.user === "") {
    throw new Error("Error: .env file don't have a UUSER property")
}

if (envData.password === "") {
    throw new Error("Error: .env file don't have a PASSWORD property")
}

if (envData.secret_token_word === "") {
    throw new Error("Error: .env file don't have a SECRET_TOKEN_WORD property")
}

export default envData