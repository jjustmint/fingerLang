import { Router } from "express";

import { getProfileInfo } from "../controllers/profile/getProfileInfo";
import { getFavorite } from "../controllers/profile/getFavorite";

const profileRouter = Router();

profileRouter.get("/getprofile/:token", getProfileInfo);
profileRouter.get("/getfavorite/:token", getFavorite);


export { profileRouter };
