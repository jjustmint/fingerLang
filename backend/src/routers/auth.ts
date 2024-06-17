import { Router } from "express";
import { Register } from "../controllers/auth/register";
import { Login } from "../controllers/auth/login";

const authRouter = Router();

authRouter.post("/register", Register);
authRouter.post("/login", Login);

export { authRouter };
