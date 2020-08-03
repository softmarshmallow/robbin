import * as functions from 'firebase-functions';
import * as express from 'express';
import * as bodyParser from "body-parser";
import { router } from "./routes"
import { config } from "dotenv"
import { resolve } from "path"


// set .env
config({ path: resolve(__dirname, "../.env") });

//initialize firebase inorder to access its services

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
    res.json({ "heelooow": "world", "version": "v2" })
})
app.use(router)


//define google cloud function name
export const api = functions.https.onRequest(main);

if (process.env.NODE_ENV === 'development') {
    main.listen(process.env.PORT, () =>
        console.log(`Server is running on http://localhost:${process.env.PORT}`),
    );
}
