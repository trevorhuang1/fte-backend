FROM docker.io/python:3.10

WORKDIR /

# --- [Install python and pip] ---
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip git
COPY . /

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn
RUN pip install Pillow

ENV GUNICORN_CMD_ARGS="--workers=1 --bind=0.0.0.0:8017"

EXPOSE 8017

CMD [ "gunicorn", "main:app" ]
