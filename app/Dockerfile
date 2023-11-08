FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app

RUN apk update && \
    apk add postgresql-dev gcc python3-dev musl-dev libpq build-base libffi-dev && \
    pip install --upgrade pip
    
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . /usr/src/app
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8080"]