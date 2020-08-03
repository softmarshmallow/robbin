import * as express from "express"
import { getIdkDictionary, postIdkDictionary } from "./controller";

const router = express.Router();

router.get(`/books`, (req, res) => {
    // todo
});

router.post(`/idontknow`, postIdkDictionary)
router.get(`/idontknow`, getIdkDictionary)

export {
    router
}
