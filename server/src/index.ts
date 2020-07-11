import * as express from 'express'
import * as bodyParser from 'body-parser'
import * as methodOverride from 'method-override';
import {router} from './routes'
import {initializeFirebaseAdmin} from "./utils/firebase"
import * as errorhandler from 'errorhandler'
import {resolve} from "path"
import {config} from "dotenv"
import * as cors from "cors";
import * as morgan from "morgan"

const app = express();

// set .env
config({path: resolve(__dirname, "../.env")});

// initialize firebase admin
initializeFirebaseAdmin();


app.use(morgan('combined'))

// region cors
app.use(cors());
// endregion

app.use(bodyParser.urlencoded({extended: true}));
const rawBodySaver = function (req, _res, buf, encoding) {
    if (buf && buf.length) {
        req.rawBody = buf.toString(encoding || 'utf8');
    }
}
app.use(bodyParser.json({verify: rawBodySaver}));
app.use(methodOverride());
app.use(express.static('public'));
app.use('/api', router);


// serve your swagger.json file
app.get('/docs/swagger.json', (req, res) => {
    res.sendFile('dist/swagger.json', {root: '.'});
});

// only use in development
if (process.env.NODE_ENV === 'development') {
    app.use(errorhandler())
}

app.listen(process.env.PORT, () =>
    console.log(`Server is running on http://localhost:${process.env.PORT}`),
);
