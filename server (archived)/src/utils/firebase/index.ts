import * as admin from "firebase-admin";

const serviceAccount = require("../../../credentials/firebase-adminsdk.json");

export function initializeFirebaseAdmin() {
    admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
        databaseURL: process.env.FIREBASE_DATABASE_URL
    });
}


