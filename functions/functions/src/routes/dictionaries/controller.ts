import { firestore } from "../../data";


interface DictionaryWordRegisterRequestBody {
    token: string
}

export async function postIdkDictionary(req, res) {
    req.body as DictionaryWordRegisterRequestBody
}

export async function getIdkDictionary(req, res) {
    const docs = await firestore.doc(`/dictionary`)
    console.log(docs);
}