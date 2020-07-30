import * as express from "express";
import { BAD_REQUEST } from "http-status-codes";


const router = express.Router()

router.post(`/`, async (req, res) => {

    // try {
    //     const uid = res.locals.uid;
    //     console.log(uid)
    //     const { email, name } = req.body;

    //     const input = new StudentSignupCreateArgument({
    //         email: email, name: name, uid: uid
    //     });
    //     console.log(input)

    //     const controller = new UserController()
    //     const resp = await controller.signUp(input)
    //     res.json(resp).send()
    // } catch (e) {
    //     console.error(e)
    //     res.status(BAD_REQUEST).json(JSON.stringify(e))
    // }

})


export {
    router
}
