FROM python:3.9-slim

# Work directory
WORKDIR /app

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=0

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

# Expose the port
EXPOSE 5000

# Define the command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]