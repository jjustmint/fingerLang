import { Request, Response } from "express";
import bcrypt from "bcrypt";
import { GetUserByUsername } from "../../services/users/getUserByUsername";
import { CreateUser } from "../../services/users/createUser";

const Register = async (req: Request, res: Response) => {
    const { username, password } = req.body;
if (!username || !password) {
    return res.status(400).json({ message: "Missing required field" });
    }

    const userResponse = await GetUserByUsername(username);
if (userResponse.length !== 0) {
    return res.status(400).json({ message: "Username Duplicated" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = await CreateUser(username, hashedPassword);

    return res.status(201).send({ newUser });
};

export { Register };
