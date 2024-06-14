import { Router } from "express";
import { getAllCategory } from "../controllers/category/getAllCategory";

const categotyRouter = Router();

categotyRouter.get("/getcategory", getAllCategory);

export { categotyRouter };
