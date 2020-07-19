import * as express from "express"

const router = express.Router();

router.get(`/`)
router.get(`/search`)

router.get(`/random`, (req, res)=>{

});



export {
    router
}
