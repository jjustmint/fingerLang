import { Router } from "express";
import { getAllLesson } from "../controllers/lesson/getAllLesson";
import { getLessonList } from "../controllers/lesson/getLessonList";

const lessonRouter = Router();

lessonRouter.get("/getlesson", getAllLesson);
lessonRouter.get("/getlessonlist/:lessonId", getLessonList);


export { lessonRouter };
