import { Module } from '@nestjs/common';
import { DevelopmentController } from './development.controller';
import { DevelopmentService } from './development.service';

@Module({
  controllers: [DevelopmentController],
  providers: [DevelopmentService]
})
export class DevelopmentModule {}
