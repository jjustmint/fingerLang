import { Router } from "express";
import { authRouter } from "./auth";
import { categotyRouter } from "./category";
import { handposeRouter } from "./handpose";
import { lessonRouter } from "./lesson";
import { profileRouter } from "./profile";

const mainRouter = Router();

mainRouter.use("/auth", authRouter);
mainRouter.use("/category", categotyRouter);
mainRouter.use("/handpose", handposeRouter);
mainRouter.use("/lesson", lessonRouter);
mainRouter.use("/profile", profileRouter);

export { mainRouter };
