import { Request, Response } from "express";
import { prisma } from "../..";
import { VerifyToken } from "../../services/token/verify";

const updateProfileImage = async (req: Request, res: Response) => {
  const { token, imageUrl } = req.body;

  try {
    // Verify the token to get the user ID
    const { id } = VerifyToken(token);

    // Update the user's profile image
    const updatedUser = await prisma.users.update({
      where: { id: id },
      data: { image_url: imageUrl },
    });

    if (!updatedUser) {
      return res.status(404).json({ error: "User not found" });
    }

    return res
      .status(200)
      .json({
        message: "Profile image updated successfully",
        profileImage: updatedUser.image_url,
      });
  } catch (error) {
    console.error("Error updating profile image:", error);
    return res
      .status(500)
      .json({ error: "An error occurred while updating the profile image" });
  }
};

export { updateProfileImage };
