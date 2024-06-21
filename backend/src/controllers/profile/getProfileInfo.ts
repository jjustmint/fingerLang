import { Request, Response } from "express";
import { prisma } from "../..";
import * as jwt from "jsonwebtoken";
import { VerifyToken } from "../../services/token/verify";

const getProfileInfo = async (req: Request, res: Response) => {
  const { token } = req.params;
  const { id } = VerifyToken(token);
  const data = await prisma.users.findUnique({
    where: {
      id: id,
    },
    select: {
      username: true,
      User_trophies: {
        include: {
          Trophies: {
            select: {
              trophy_name: true,
              trophy_url: true,
            },
          },
        },
      },
      Favorite: true,
    },
  });
  const response = {
    username: data?.username,
    Trophies: data?.User_trophies.map((user_trophy) => user_trophy.Trophies),
  };
  return res.json(response);
};

export { getProfileInfo };
