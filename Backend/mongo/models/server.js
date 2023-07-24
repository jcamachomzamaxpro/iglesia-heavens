import express from "express";
import cors from "cors";
import dbConnection from "../config/config.js"
import creyentesRoutes from "../routes/creyentes.routes.js";

class ServerMongo {

    constructor(){
        this.app = express();
        this.port = process.env.PORTMONGO
        this.creyentesPath = '/api/creyentes';

        this.connectMongoDB();
        this.middlewares();
        this.routes();
    }
    async connectMongoDB(){
        await dbConnection();
    }
    middlewares(){
        this.app.use(cors());
        this.app.use(express.json());
        this.app.use(express.static('public'));
    }

    routes(){
        this.app.use(this.creyentesPath, creyentesRoutes);
    }

    listen(){
        this.app.listen(this.port, ()=>{
            console.log(`Server Running on port ${this.port}`);  
        })
    }
}

export default ServerMongo;