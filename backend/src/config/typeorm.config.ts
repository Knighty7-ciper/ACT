import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { ConfigService } from '@nestjs/config';
import { UserEntity } from '../modules/user/entities/user.entity';
import { WalletEntity } from '../modules/wallet/entities/wallet.entity';
import { TransactionEntity } from '../modules/transaction/entities/transaction.entity';
import { CurrencyEntity } from '../modules/currency/entities/currency.entity';
import { CountryEntity } from '../modules/country/entities/country.entity';
import { ExchangeRateEntity } from '../modules/exchange-rate/entities/exchange-rate.entity';
import { NewsEntity } from '../modules/news/entities/news.entity';
import { EconomicIndicatorEntity } from '../modules/economic-indicator/entities/economic-indicator.entity';
import { AdminEntity } from '../modules/admin/entities/admin.entity';
import { RoleEntity } from '../modules/role/entities/role.entity';
import { NewsCategoryEntity } from '../modules/news-category/entities/news-category.entity';

export const typeormConfig = (
  configService: ConfigService,
): TypeOrmModuleOptions => {
  const entities = [
    UserEntity,
    WalletEntity,
    TransactionEntity,
    CurrencyEntity,
    CountryEntity,
    ExchangeRateEntity,
    NewsEntity,
    EconomicIndicatorEntity,
    AdminEntity,
    RoleEntity,
    NewsCategoryEntity,
  ];
  const common = {
    entities,
    synchronize: configService.get('NODE_ENV') === 'development',
    logging: configService.get('NODE_ENV') === 'development',
    dropSchema: false,
    ssl:
      configService.get('NODE_ENV') === 'production'
        ? { rejectUnauthorized: false }
        : false,
  } as Partial<TypeOrmModuleOptions>;

  const url =
    configService.get<string>('DATABASE_URL') ||
    configService.get<string>('POSTGRES_URL') ||
    configService.get<string>('POSTGRES_URL_NON_POOLING');
  if (url) {
    return {
      type: 'postgres',
      url,
      ssl: { rejectUnauthorized: false },
      ...common,
    } as TypeOrmModuleOptions;
  }

  return {
    type: 'postgres',
    host: configService.get('DATABASE_HOST', 'localhost'),
    port: configService.get('DATABASE_PORT', 5432),
    username: configService.get('DATABASE_USER', 'postgres'),
    password: configService.get('DATABASE_PASSWORD', 'postgres'),
    database: configService.get('DATABASE_NAME', 'african_currency'),
    ...common,
  } as TypeOrmModuleOptions;
};
