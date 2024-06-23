import { Request, Response } from "express";
import { prisma } from "../..";
import { VerifyToken } from "../../services/token/verify";

const addFavorite = async (req: Request, res: Response) => {
  const { token } = req.body;
  const { postId } = req.body;


  const { id } = VerifyToken(token);

  try {
    await prisma.favorite.create({
      data: {
        user_id: id,
        post_id: postId,
      },
    });

    return res.status(200).json({ message: "Favorite added successfully" });
  } catch (error) {
    console.error("Error adding favorite:", error);
    return res
      .status(500)
      .json({ error: "An error occurred while adding the favorite" });
  }
};

export { addFavorite };
