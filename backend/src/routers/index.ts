import { Router } from "express";
import { authRouter } from "./auth";
import { categotyRouter } from "./category";
import { handposeRouter } from "./handpose";

const mainRouter = Router();

mainRouter.use("/auth", authRouter);
mainRouter.use("/category", categotyRouter);
mainRouter.use("/handpose", handposeRouter);

export { mainRouter };
