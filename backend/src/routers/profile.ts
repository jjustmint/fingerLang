import { Router } from "express";
import { getProfileInfo } from "../controllers/profile/getProfileInfo";
import { getFavorite } from "../controllers/profile/getFavorite";
import { addFavorite } from "../controllers/profile/postFavorite";
import { updateProfileImage } from "../controllers/profile/updateProfileImage"; 

const profileRouter = Router();

profileRouter.get("/getprofile/:token", getProfileInfo);
profileRouter.get("/getfavorite/:token", getFavorite);
profileRouter.post("/addfavorite", addFavorite);
profileRouter.post("/updateProfileImage", updateProfileImage);

export { profileRouter };
