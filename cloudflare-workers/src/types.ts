import type { Env } from './index';

export type AppEnv = {
  Bindings: Env;
  Variables: {
    userId: string;
  };
};
