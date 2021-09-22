import logging

from {{cookiecutter.project_slug}}.settings import settings

logger = logging.getLogger('cloud-function')


logging.basicConfig(
    level=logging.getLevelName(settings.log_level)
)


def hook(*args, **kwargs) -> str:
    return 'OK'
