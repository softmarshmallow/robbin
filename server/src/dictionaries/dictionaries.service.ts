import { Injectable } from '@nestjs/common';


@Injectable()
export class DictionaryService {
    private readonly dictionaries = [];

    create(dictionary) {
        this.dictionaries.push(dictionary);
    }

    findAll(): any[] {
        return this.dictionaries;
    }
}