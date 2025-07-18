FROM python:3.10-slim

WORKDIR /app

COPY ml-api /app/ml-api
COPY templates /app/templates
COPY static /app/static
COPY ml-api/app.py /app/app.py

RUN pip install --no-cache-dir -r ml-api/requirements.txt

EXPOSE 8080

CMD ["python", "app.py"]
