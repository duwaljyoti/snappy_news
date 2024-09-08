FROM python:3.10-alpine

ENV PYTHONUNBUFFERED=1

RUN apk update \
    && apk add --no-cache --virtual .build-deps \
    ca-certificates gcc linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev libc-dev \
    postgresql-dev cargo

RUN pip install --upgrade pip

# Create group and user
RUN addgroup snappy_user && adduser -D snappy_user -G snappy_user -h /home/snappy_user

ENV HOME /home/snappy_user

ENV APP_DIR ${HOME}/snappy_news

WORKDIR ${APP_DIR}

ADD requirements.txt ${APP_DIR}/

RUN pip install -r ${APP_DIR}/requirements.txt

COPY ./ ${APP_DIR}

RUN chown -R snappy_user:snappy_user ${APP_DIR}

USER snappy_user

EXPOSE 8000

ENTRYPOINT sh -c "python manage.py runserver 0.0.0.0:8000"

