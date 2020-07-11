import * as express from "express";

import {router as signupRouter} from "./signup";
import {entryAuthMiddleware} from "../../middlewares/auth.middleware";

const router = express.Router();

router.use(`/signup`, entryAuthMiddleware, signupRouter);

export {
    router
}
