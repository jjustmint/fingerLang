import { Request, Response } from "express";
import { prisma } from "../..";

const getHandposeByCategoryId = async (req: Request, res: Response) => {
  // const params = req.params;
  // const id = params.categoryId;
  const id = parseInt(req.params.categoryId);
  const data = await prisma.hand_posts.findMany({
    where: {
      category_id: id,
    },
    select: {
      id: true,
      image_url: true,
      name: true,
      post_url: true,
      desc: true,
    },
  });

  return res.json(data);
};

export { getHandposeByCategoryId };
