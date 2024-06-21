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
        },
      },
    },
  });
  //   const response = {
  //     username: data?.username,
  //     Trophies: data?.User_trophies.map((user_trophy) => user_trophy.Trophies),
  //   };
  return res.json(data);
};

export { getFavorite };
