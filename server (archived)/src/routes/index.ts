import * as express from "express";

const router = express.Router();

import {router as developmentRouter} from "./development";
import {router as userRouter} from "./users";

router.use(`/development`, developmentRouter);
router.use(`/users`, userRouter);


export {
    router
}
