import { Request, Response } from "express";
import bcrypt from 'bcrypt';
import { GetUserByUsername } from "../../services/users/getUserByUsername";

const Register = async (req: Request, res: Response) => {
    const { username, password } = req.body;
    if (!username || !password){
        return res.status(400).json({ message: 'Missing required field' });
    }

    const userResponse = await GetUserByUsername(username);
    if(userResponse.length !== 0){
        return res.status(400).json({message: 'Username Duplicated'});
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    //prisma create
    //register done

    //login


};

export { Register };