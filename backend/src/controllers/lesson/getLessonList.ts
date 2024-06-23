import { Request, Response } from "express";
import { prisma } from "../..";

const getLessonList = async (req: Request, res: Response) => {
  const id = parseInt(req.params.lessonId);

  try {
    const data = await prisma.lesson_lists.findMany({
      where: {
        lesson_id: id,
      },
      select: {
        lesson_id: true,
        Hand_posts: true,
      },
    });

    return res.json(data);
  } catch (error) {
    console.error("Error fetching lesson list:", error);
    return res
      .status(500)
      .json({ error: "An error occurred while fetching the lesson list" });
  }
};

export { getLessonList };
