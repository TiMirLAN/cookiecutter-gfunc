from typing import Optional

from pydantic import BaseSettings


class Settings(BaseSettings):
    sentry_dsn: Optional[str]

    log_level: str = 'INFO'
    log_format: Optional[str]


settings = Settings()
