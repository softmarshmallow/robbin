import * as express from "express";

const router = express.Router();

import { router as developmentRouter } from "./development";
import { router as userRouter } from "./users";
import { router as dictionariesRouter } from "./dictionaries";

router.use(`/development`, developmentRouter);
router.use(`/users`, userRouter);
router.use(`/dictionaries`, dictionariesRouter);


export {
    router
}
