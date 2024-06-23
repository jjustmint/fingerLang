import { Request, Response } from "express";
import { prisma } from "../..";
import { VerifyToken } from "../../services/token/verify";

const getProfileInfo = async (req: Request, res: Response) => {
  const { token } = req.params;

  try {
    const { id } = VerifyToken(token);

    const data = await prisma.users.findUnique({
      where: { id: id },
      select: {
        username: true,
        image_url: true,
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

    if (!data) {
      return res.status(404).json({ message: "User not found" });
    }

    const response = {
      username: data.username,
      image_url: data.image_url,
      Trophies: data.User_trophies.map((user_trophy) => user_trophy.Trophies),
    };

    return res.json(response);
  } catch (error) {
    console.error("Error fetching profile info:", error);
    return res.status(500).json({ error: "An error occurred while fetching profile info" });
  }
};

export { getProfileInfo };

