FROM python:3.9-slim
WORKDIR /usr/src/app

RUN apt update && apt install -y tcpdump
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . /usr/src/app
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8080"]