import { Request, Response } from "express";
import { prisma } from "../..";

const getAllCategory = async (req: Request, res: Response) => {
  const data = await prisma.categories.findMany();
  return res.json(data);
};

export { getAllCategory };
