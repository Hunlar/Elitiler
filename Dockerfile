
FROM debian:latest

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python3-venv \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /safone/
WORKDIR /safone/

COPY . /safone/

RUN python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip setuptools wheel

RUN pip install -r requirements.txt

CMD ["python", "main.py"]

