FROM python:2.7-jessie

LABEL "com.github.actions.name"="Django Coverage Action for Python 2.7"
LABEL "com.github.actions.description"="Python Django Coverage GitHub Action"
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="black"

RUN apt-get update \
&& apt-get install -y --no-install-recommends git gcc libc-dev build-essential libpq-dev \
&& apt-get purge -y --auto-remove \
&& rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip virtualenv

USER root


COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
