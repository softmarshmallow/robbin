import * as express from "express"
import { LexicoApi } from "lexico-node";
import { errors } from "@bridged.io/express-response"
const router = express.Router();

router.get(`/word`, async (req, res) => {
    const { word } = req.query
    if (!word) {
        throw new errors.request.BadRequestError("you have to pass query 'word'");
    }
    const resp = await LexicoApi.entries(word as string);
    const mapped = {
        word: resp.word,
        senses: resp.results[0].lexicalEntries[0].entries[0].senses
    }
    res.json(mapped);
});



export {
    router
}
