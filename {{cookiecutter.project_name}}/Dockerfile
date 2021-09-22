FROM python:3.9

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
  cd /usr/local/bin && \
  ln -s /opt/poetry/bin/poetry

COPY ./pyproject.toml ./poetry.lock /app/
COPY ./main.py /app/
COPY ./{{ cookiecutter.project_slug }} /app/{{ cookiecutter.project_slug }}
WORKDIR /app/

RUN poetry config virtualenvs.create false
RUN poetry install --no-root --no-dev

CMD poetry run functions_framework --target hook --port 8080 --debug
EXPOSE 8080
