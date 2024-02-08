FROM python:3.9-slim

# Work directory
WORKDIR /app

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=0

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

# Expose the port
EXPOSE 8080

# Define the command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]