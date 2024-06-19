import { Hand_posts } from "./../../../node_modules/.prisma/client/index.d";
import { Request, Response } from "express";
import { prisma } from "../..";

const getAllLesson = async (req: Request, res: Response) => {
  const data = await prisma.lessons.findMany({
    include: {
      Lesson_lists: {
        include: {
          Hand_posts: true,
        },
      },
    },
  });
  return res.json(data);
};

export { getAllLesson };
