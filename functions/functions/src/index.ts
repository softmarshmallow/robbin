import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as express from 'express';
import * as bodyParser from "body-parser";
import { router } from "./routes"
//initialize firebase inorder to access its services
admin.initializeApp(functions.config().firebase);

//initialize express server
const app = express();
const main = express();

//add the path to receive request and set json as bodyParser to process the body 
main.use('/api', app);
main.use(bodyParser.json());
main.use(bodyParser.urlencoded({ extended: false }));

//initialize the database and the collection 
// const db = admin.firestore();
// const userCollection = 'users';


app.get(`/`, (req, res) => {
    res.json({ "heelooow": "world" })
})
app.use(router)


//define google cloud function name
export const api = functions.https.onRequest(main);