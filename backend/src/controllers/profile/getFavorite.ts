import { Request, Response } from "express";
import { prisma } from "../..";
import * as jwt from "jsonwebtoken";
import { VerifyToken } from "../../services/token/verify";

const getFavorite = async (req: Request, res: Response) => {
  const { token } = req.params;
  const { id } = VerifyToken(token);
  const data = await prisma.users.findUnique({
    where: {
      id: id,
    },
    select: {
      username: true,
      Favorite: {
        select: {
          post_id: true,
          Hand_posts: {
            select: {
              name: true,
            },
          },
        },
      },
    },
  });
  const formattedData = {
    username: data?.username,
    Favorite: data?.Favorite.map((favorite) => {
      return {
        post_id: favorite.post_id,
        name: favorite.Hand_posts.name,
      };
    }),
  };
  return res.json(formattedData);
};

export { getFavorite };
