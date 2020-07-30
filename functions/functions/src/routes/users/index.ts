import * as express from "express";

import { router as signupRouter } from "./signup";

const router = express.Router();

router.use(`/signup`, signupRouter);

export {
    router
}
