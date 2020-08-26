import * as chalk from "chalk";
import {DEV_ENV_BOT_UID, ENV_DEVELOPMENT} from "../data/constants/system.constant";
import * as admin from "firebase-admin";
import {UserController} from "../data/controllers/user.controller";
import {UNAUTHORIZED} from "http-status-codes";

async function getUser(token: string) {
    let uid: string;
    if (process.env.NODE_ENV == ENV_DEVELOPMENT) {
        if (token == "test-token") {
            console.log("development environment, accepting test token.");
            uid = ""; // todo
        }
    }
    uid = await getUid(token);
    return await (new UserController({uid: uid})).fetchSingle()
}

async function getUid(token: string) {
    return (await admin.auth().verifyIdToken(token)).uid;
}

function getAuthTokenFromHeader(req): string {
    try {
        const authorization = req.headers.authorization;
        // token is formatted as `Bearer <REAL_TOKEN_VALUE>`, we split with white spaces.
        return authorization.split(' ')[1];
    } catch (e) {
        return null;
    }
}

export async function entryAuthMiddleware(req, res, next) {
    try {
        const token = getAuthTokenFromHeader(req);
        if (token) {
            let uid;
            if (process.env.NODE_ENV == ENV_DEVELOPMENT && token == "test-token") {
                console.log("development environment, accepting test token.");
                uid = DEV_ENV_BOT_UID;
            } else {
                uid = await getUid(token);
            }
            console.log(`start validating request with token ${token} from 'entryAuthMiddleware'`)
            res.locals.uid = uid
            next()
        } else {
            unauthorized(res, `you did not pass token`)
        }
    } catch (e) {
        unauthorized(res, `you passed invalid token`)
    }
}

export async function userAuthMiddleware(req, res, next) {
    const token = getAuthTokenFromHeader(req);
    console.log(`start validating request with token ${token}`)

    let user;

    if (token) {
        try {
            user = await getUser(token);
            res.locals.user = user;
            next()
        } catch (e) {
            unauthorized(res, e);
            return;
        }
    } else {
        unauthorized(res, "no authentication provided");
        return;
    }
}


function unauthorized(res, reason: string) {
    console.log(chalk.bgRed(`API AUTH FAILED:: reason: ${reason}`))
    res.status(UNAUTHORIZED).json({
        message: reason
    }).send();
}

