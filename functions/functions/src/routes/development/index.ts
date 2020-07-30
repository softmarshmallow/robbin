import * as express from "express"
import { scrap } from "lexico-node";
import { errors, response } from "@bridged.io/express-response"

const router = express.Router();

router.get(`/word`, async (req, res) => {
    try {
        const { word } = req.query
        if (!word) {
            throw new errors.request.BadRequestError("you have to pass query 'word'");
        }
        const resp = await scrap({ token: word as string });
        response.single(resp, req, res).send()
    } catch (e) {
        response.error(e, req, res).send()
    }
});


export {
    router
}
