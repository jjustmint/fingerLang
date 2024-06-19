import { Router } from "express";
import { getAllLesson } from "../controllers/lesson/getAllLesson";

const lessonRouter = Router();

lessonRouter.get("/getlesson", getAllLesson);

export { lessonRouter };
