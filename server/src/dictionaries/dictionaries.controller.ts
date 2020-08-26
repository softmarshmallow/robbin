import { Body, Controller, Get, Param, Post, } from '@nestjs/common';
import { DictionaryService } from './dictionaries.service';

@Controller('dictionaries')
export class DictionariesController {
    constructor(private readonly dictionariesService: DictionaryService) { }

    @Post()
    async create(@Body() body: any) {
        this.dictionariesService.create(body);
    }

    @Get()
    async findAll(): Promise<any[]> {
        return this.dictionariesService.findAll();
    }

    @Get(':id')
    findOne(
        @Param('id')
        id: number,
    ) {
        // get by ID logic
    }


    @Get('/idontknow')
    listIdontknow() {

    }

    @Post('/idontknow')
    registerIdontknow(
        @Body() Body
    ) {
    }
}