import {PrismaClient} from "@prisma/client"
import {ModelSpec} from "../../specs/model";

export const prisma = new PrismaClient()

export abstract class PrismaDataController<ID, IN extends BaseCreateArgument, OUT, DETAILED> {
    pk: ID
    spec: ModelSpec
    uniqueWhere: {}

    protected constructor(props: {
        pk?: ID
        spec: ModelSpec
    }) {
        this.pk = props.pk;
        this.spec = props.spec;

        // region build unique where
        const uniqueWhereQuery = {};
        uniqueWhereQuery[this.spec.pk] = this.pk;
        this.uniqueWhere = uniqueWhereQuery
        // endregion build unique where
    }

    async create(input: IN): Promise<OUT> {
        const created = await prisma[this.spec.singular].create({
            data: input
        })
        console.log(`prisma/created:: ${this.spec.key} with input ${JSON.stringify(input, null, 2)}.. record is ${JSON.stringify(created, null, 2)}`)
        return created;
    }

    abstract update(input: any)

    async delete() {
        const deleted = await prisma[this.spec.singular].delete({
            where: this.uniqueWhere
        });
        console.log(`deleted ${this.spec.key} of ${this.spec.pk} ${JSON.stringify(deleted, null, 2)}`)
        return deleted
    }

    async fetchSingle(): Promise<OUT> {
        const fetched = await prisma[this.spec.singular].findOne({
            where: this.uniqueWhere
        });
        console.log(`fetched ${this.spec.key} of ${this.spec.pk} ${JSON.stringify(fetched, null, 2)}`)
        return fetched
    }

    abstract fetchSingleDetailed()

    abstract fetchSingleCustom()

    fetchQueried() {
        throw Error()
    }
}


export abstract class BaseCrudArgument {

}

export abstract class BaseCreateArgument extends BaseCrudArgument {
}
