import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DictionariesModule } from './dictionaries/dictionaries.module';
import { WordsController } from './words/words.controller';
import { WordsModule } from './words/words.module';
import { UsersModule } from './users/users.module';
import { DevelopmentModule } from './development/development.module';

@Module({
  imports: [
    DictionariesModule,
    WordsModule,
    UsersModule,
    DevelopmentModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
