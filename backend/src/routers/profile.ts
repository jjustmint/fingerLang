import { Router } from "express";

import { getProfileInfo } from "../controllers/profile/getProfileInfo";

const profileRouter = Router();

profileRouter.get("/getprofile/:token", getProfileInfo);

export { profileRouter };
