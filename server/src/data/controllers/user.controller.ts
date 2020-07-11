import {BaseCreateArgument, prisma, PrismaDataController} from "./controller";
import {MODEL_SPEC_USER} from "../../specs/model";


export enum UserType {
    STUDENT = "STUDENT",
    TUTOR = "TUTOR",
    ROBOT = "ROBOT",
}

export class UserCreateArguments extends BaseCreateArgument {
    name: string
    email: string
    uid: string
    type: UserType

    constructor(props: {
        name: string
        email: string
        uid: string
        type: UserType
    }) {
        super();
        this.name = props.name
        this.email = props.email
        this.uid = props.uid
        this.type = props.type
    }
}

export class StudentSignupCreateArgument extends UserCreateArguments {
    constructor(props: {
        name: string
        email: string
        uid: string
    }) {
        super({
            email: props.email,
            name: props.name,
            type: UserType.STUDENT,
            uid: props.uid
        });
    }
}

export class UserController extends PrismaDataController<string, UserCreateArguments, any, any> {
    constructor(props?:{
        uid?: string
    }) {
        super({
            pk: props.uid,
            spec: MODEL_SPEC_USER
        });
    }

    async signUp(input: StudentSignupCreateArgument) {
        return await this.create(input)
    }

    fetchSingleCustom() {
    }

    fetchSingleDetailed() {
    }

    update() {
    }
}
