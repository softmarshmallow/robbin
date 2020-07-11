import {PrismaClient} from "@prisma/client"

const prisma = new PrismaClient()

prisma.user.create({
    data: {
        uid: "",
        email: "",
        name: "",
        type: "STUDENT"
    }
})
