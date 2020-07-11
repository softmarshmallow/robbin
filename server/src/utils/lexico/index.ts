import Axios from 'axios';

import {config} from "dotenv";
import {resolve} from "path";

config({path: resolve(__dirname, ".env")});

const LEXICO_API_BASE_URL = "https://od-api.oxforddictionaries.com/api/v2/";
const axios = Axios.create({
    baseURL: LEXICO_API_BASE_URL,
    headers: {
        "app_id": process.env.LEXICO_APP_ID,
        "app_key": process.env.LEXICO_APP_KEY
    }
});

const endpoint = "entries"
const language_code = "en-us"

export class LexicoApi {
    static async word(t: string): Promise<LexicoResponse> {
        console.log(process.env.PORT);
        const resp = await axios.get<LexicoResponse>(`/${endpoint}/${language_code}/${t.toLowerCase()}`, {},);
        console.log(`code ${resp.status}`)
        console.log("text \n" + resp.data)
        console.log("json \n" + JSON.stringify(resp.data, null, 2))
        return resp.data;
    }
}


export interface LexicoResponse {
    id: string
    metadata: {
        operation: string
        provider: string
        schema: string
    }
    results: {
        id: string
        language: string
        lexicalEntries: {
            derivatives: {
                id: string
                text: string
            }[]
            entries: LexicoEntry[]
            language: string
            lexicalCategory: string
            text: string
        }[]
        type: string
        word: string
    }[]
    word: string
}


interface LexicoEntry {
    etymologies: string[]
    grammaticalFeatures: LexicoGrammaticalFeature[]
    pronunciations: LexicoPronounce[]
    senses: LexicoSense[]
}

interface LexicoGrammaticalFeature {
    id: string
    text: string
    type: string
}

interface LexicoPronounce {
    dialects: string[]
    phoneticNotation: string
    phoneticSpelling: string
}

interface LexicoSense {
    id: string
    definitions: string[]
    examples: string[]
    shortDefinitions: string
}
