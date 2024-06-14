import { Router } from "express";
import { getHandposeByCategoryId } from "../controllers/handpose/getHandPoseByCategoryId";
import { getHandposeById } from "../controllers/handpose/getHandPoseById";

const handposeRouter = Router();

handposeRouter.get("/getbycategory/:categoryId", getHandposeByCategoryId);
handposeRouter.get("/getbyid/:handposeId", getHandposeById);

export { handposeRouter };
