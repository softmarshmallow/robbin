import { MODEL_SPEC_USER } from "./user.model";

export interface ModelSpec {
    key?: string
    pk: string // id or uid. the name of the pk's field
    singular: string
    plural: string
}

export {
    MODEL_SPEC_USER
}

