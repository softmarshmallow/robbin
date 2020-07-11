import * as express from "express";
import {
    StudentSignupCreateArgument,
    UserController
} from "../../../data/controllers/user.controller";


const router = express.Router()

router.post(`/signup`, async (req, res) => {

    const {email, name, uid} = req.body;

    const input = new StudentSignupCreateArgument({
        email: email, name: name, uid: uid
    });

    const controller = new UserController()
    const resp = await controller.signUp(input)

})


export {
    router
}
