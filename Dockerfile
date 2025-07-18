# Use a lightweight Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy app files
COPY ml-api /app/ml-api
COPY templates /app/templates
COPY static /app/static
COPY ml-api/app.py /app/app.py

# Install dependencies
RUN pip install --no-cache-dir -r ml-api/requirements.txt

# Set environment variable for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8080

# Expose port for Render
EXPOSE 8080

# Start the Flask app
CMD ["flask", "run"]
