# Dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY ml-api /app/ml-api
COPY ml-api/templates /app/templates
COPY ml-api/static /app/static
COPY ml-api/app.py /app/app.py

RUN pip install --no-cache-dir -r ml-api/requirements.txt

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8080

EXPOSE 8080

CMD ["flask", "run"]
