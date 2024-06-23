import { Router } from "express";
import { getProfileInfo } from "../controllers/profile/getProfileInfo";
import { getFavorite } from "../controllers/profile/getFavorite";
import { addFavorite } from "../controllers/profile/postFavorite";
import { updateProfileImage } from "../controllers/profile/updateProfileImage";
import { addTrophy } from "../controllers/profile/postTrophy";
import { deleteFavorite } from "../controllers/profile/deleteFavorite";
 

const profileRouter = Router();

profileRouter.get("/getprofile/:token", getProfileInfo);
profileRouter.get("/getfavorite/:token", getFavorite);
profileRouter.post("/addfavorite", addFavorite);
profileRouter.post("/addtrophy", addTrophy);
profileRouter.post("/updateProfileImage", updateProfileImage);
profileRouter.delete("/deletefavorite", deleteFavorite);

export { profileRouter };
