import { Request, Response } from "express";
import { prisma } from "../..";

const getLessonList = async (req: Request, res: Response) => {
  const id = parseInt(req.params.lessonId);
  const data = await prisma.lesson_lists.findMany({
    where:{
        lesson_id: id,
    },
  });
  return res.json(data);
};

export { getLessonList };
