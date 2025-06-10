# Use official Python base image with slim variant for smaller size
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app/backend

# Install system dependencies first
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    default-libmysqlclient-dev \
    pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application (adjust as needed)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project.wsgi:application"]
