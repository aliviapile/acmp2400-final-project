FROM python:3.12-slim

# Prevent Python from buffering output
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copy dependency file first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Django app port
EXPOSE 8000

# Start Django so GitHub Actions can reach it
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
