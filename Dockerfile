FROM python:3.8

WORKDIR /app/fyle-interview-intern-backend

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=core/server.py

RUN apt update && apt upgrade -y

RUN flask db upgrade -d core/migrations

EXPOSE 7755

ENTRYPOINT ["bash", "run.sh"]
