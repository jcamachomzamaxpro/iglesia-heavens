import express from "express";
import cors from 'cors';
import conectarDB from "../config/dbConnect.js";
import creyentesRoutes from "../routes/creyentes.routes.js";

class ServerMySql{

    constructor(){
        this.app = express();
        this.port = process.env.PORTSQL;

        this.creyentesPath = '/api/creyentes';

        this.conectar();
        this.middlewares();
        this.routes();
    }

    middlewares(){
        this.app.use(cors());
        this.app.use(express.static('public'));
        this.app.use(express.json());
    }

    async conectar(){
        await conectarDB();
    }

    routes(){
        this.app.use(this.creyentesPath, creyentesRoutes);
    }

    listen(){
        this.app.listen(this.port, ()=>{
            console.log(`SERVER MYSQL RUNNING ON PORT ${this.port}`);
        });
    }
}

export default ServerMySql;