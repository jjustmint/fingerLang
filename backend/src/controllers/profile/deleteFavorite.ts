import { Request, Response } from "express";
import { prisma } from "../..";
import { VerifyToken } from "../../services/token/verify";

const deleteFavorite = async (req: Request, res: Response) => {
  const { token } = req.body;
  const { postId } = req.body;

  const { id } = VerifyToken(token);

  try {
    const existingFavorite = await prisma.favorite.findFirst({
      where: {
        user_id: id,
        post_id: postId,
      },
    });

    if (!existingFavorite) {
      return res.status(404).json({ error: "Favorite not found" });
    }

    await prisma.favorite.delete({
      where: {
        id: existingFavorite.id,
      },
    });

    return res.status(200).json({ message: "Favorite deleted successfully" });
  } catch (error) {
    console.error("Error deleting favorite:", error);
    return res
      .status(500)
      .json({ error: "An error occurred while deleting the favorite" });
  }
};

export { deleteFavorite };
