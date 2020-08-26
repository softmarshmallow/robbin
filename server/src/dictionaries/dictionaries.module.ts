import { Module } from '@nestjs/common';
import { DictionaryService } from './dictionaries.service';
import { DictionariesController } from './dictionaries.controller';

@Module({
    controllers: [DictionariesController],
    providers: [DictionaryService],
})
export class DictionariesModule { }