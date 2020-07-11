import * as express from "express";

const router = express.Router();

import {router as developmentRouter} from "./development";

router.use(`/development`, developmentRouter);


export {
    router
}
