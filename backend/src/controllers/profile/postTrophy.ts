import { Request, Response } from "express";
import { prisma } from "../..";
import { VerifyToken } from "../../services/token/verify";

const addTrophy = async (req: Request, res: Response) => {
  const { token, trophyId } = req.body;

  const { id } = VerifyToken(token);

  try {
    await prisma.user_trophies.create({
      data: {
        user_id: id,
        trophy_id: trophyId,
      },
    });

    return res.status(200).json({ message: "Trophy added successfully" });
  } catch (error) {
    console.error("Error adding trophy:", error);
    return res
      .status(500)
      .json({ error: "An error occurred while adding the trophy" });
  }
};

export { addTrophy };
