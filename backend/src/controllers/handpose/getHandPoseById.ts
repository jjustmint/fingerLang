import { Request, Response } from "express";
import { prisma } from "../..";

const getHandposeById = async (req: Request, res: Response) => {
  // const params = req.params;
  // const id = params.categoryId;
  const id = parseInt(req.params.handposeId);
  const data = await prisma.hand_posts.findUnique({
    where: {
      id: id,
    },
    select: {
      name: true,
      desc: true,
      post_url: true,
    },
  });

  return res.json(data);
};

export { getHandposeById };
