import { PrismaClient } from '@prisma/client';
import express, { Request, Response } from 'express';
import { mainRouter } from './routers';

const app = express();
const port = 8000;

export const prisma = new PrismaClient();

app.use(express.json());

app.get('/',(req: Request, res: Response) =>{
    res.send('Hello World');
});

app.use(mainRouter);

app.listen(port, () =>{
    console.log(`Server is running on port ${port}`);
});