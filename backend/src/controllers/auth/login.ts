import { Request, Response } from "express";
import { GetUserByUsername } from "../../services/users/getUserByUsername";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const Login = async (req: Request, res: Response) => {
try {
    const { username, password } = req.body;
    const users = await GetUserByUsername(username);
    if (users.length === 0) {
    return res.status(400).json({ message: "Username not found" });
    }
    const isPasswordCorrect: boolean = bcrypt.compareSync(
        password,
        users[0].password
    );

    if (!isPasswordCorrect) {
        return res.status(404).json({ message: "Password is incorrect" });
    }
    const tokenData = {
        id: users[0].id,
        username: users[0].username,
    };
    const token = jwt.sign(tokenData, process.env.JWT_SECRET!);
    return res.status(200).json({ token });
    } catch (e) {
    return res.status(500).json({ message: "Error signing in" });
    }
};

export { Login };
