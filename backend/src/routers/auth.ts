import { Router } from "express";
import { Register } from "../controllers/auth/register";

const authRouter = Router();

authRouter.post('/register', Register);

export { authRouter };
