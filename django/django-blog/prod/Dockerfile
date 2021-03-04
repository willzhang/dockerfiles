FROM python:3.6.10-alpine3.11 as builder

ENV GIT_URL=https://github.com/stacklens/django_blog_tutorial.git

WORKDIR /usr/src/app

RUN apk update \
    && apk add --no-cache git build-base mariadb-connector-c-dev \
    && apk add --no-cache --virtual .build-deps openssl-dev gcc musl-dev python3-dev libffi-dev jpeg-dev make mariadb-dev

RUN git clone $GIT_URL --depth=1 . \
    && echo -e "gunicorn \nbootstrap4 \nmysqlclient" >> requirements.txt

RUN pip install --upgrade pip wheel \
    && pip wheel -r requirements.txt  --wheel-dir=wheels \
    && apk del .build-deps


FROM python:3.6.10-alpine3.11

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /home/app \
    && addgroup -S app && adduser -S app -G app

ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME \
    && mkdir $APP_HOME/collected_static

WORKDIR $APP_HOME

COPY --from=builder /usr/src/app .
RUN apk update \
    && apk add --no-cache bash libjpeg mariadb-dev \
    && pip install --no-index --find-links=wheels -r requirements.txt \
    && rm -rf wheels

ADD settings.py my_blog/
ADD default.conf /etc/nginx/conf.d/
ADD entrypoint.sh .

RUN chmod +x entrypoint.sh \
    && chown -R app:app $APP_HOME

USER app

ENTRYPOINT ["/home/app/web/entrypoint.sh"]
