import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { Logger } from 'nestjs-pino';
import { AppConfigDto } from './common/dtos/app-config.dto';
import { AppModule } from './modules/app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { bufferLogs: true });
  const configService = app.get(ConfigService<AppConfigDto, true>);

  app.useLogger(app.get(Logger));

  app.enableCors();
  app.enableVersioning();

  await app.listen(configService.get('PORT'));
}

void bootstrap();
