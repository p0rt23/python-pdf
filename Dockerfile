FROM ubuntu:latest

ENV PYTHONUNBUFFERED = 1

# https://textract.readthedocs.io/en/stable/installation.html
RUN apt-get update && apt-get install -y \
  python3-dev python3-venv libxml2-dev libxslt1-dev \
  antiword unrtf poppler-utils pstotext \
  tesseract-ocr flac ffmpeg lame libmad0 \
  libsox-fmt-mp3 sox libjpeg-dev swig \
  zlib1g-dev

WORKDIR /app

# Setup python3 venv
RUN python3 -m venv /app/env 
ENV VIRTUAL_ENV /app/env
ENV PATH /app/env/bin:$PATH

COPY requirements.txt .
COPY app/ .

RUN --mount=type=cache,target=/root/.cache \
  pip install -r requirements.txt

CMD ["python3", "app.py"]
