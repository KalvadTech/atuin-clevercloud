FROM alpine:3.20

RUN apk update && apk add --no-cache postgresql-libs \
    postgresql-dev \
    gcc \
    python3-dev \
    musl-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    make \
    gettext \
    curl \
    git \
    rust \
    bc \
    icu-data-full \
    bash \
    g++

# create directory for the app user
RUN mkdir -p /home/app/.local/bin

# create the app user
RUN addgroup -g 1000 app && adduser --shell /bin/bash -u 1000 -G app -h /home/app -D app
ENV HOME=/home/app
WORKDIR $HOME
RUN chown -R app:app $HOME

USER app
RUN curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

COPY --chown=app:app docker_run.sh docker_run.sh
CMD ["./docker_run.sh"]