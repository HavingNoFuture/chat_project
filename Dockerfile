FROM python:3.11.1-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONIOENCODING UTF-8
ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:ru
ENV LC_ALL ru_RU.UTF-8

RUN pip install --upgrade pip && pip install 'poetry==1.3'

COPY chat_app /chat_app
COPY poetry.lock pyproject.toml /chat_app/
COPY .env /chat_app/.env
WORKDIR /chat_app
EXPOSE 8000

RUN poetry config virtualenvs.create false \
    && poetry install


RUN adduser --disabled-password user
USER user
