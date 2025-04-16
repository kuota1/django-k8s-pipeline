FROM python:3.10-slim AS base

WORKDIR /app

# Instalar dependencias de sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl\
    && rm -rf /var/lib/apt/lists/*
    
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM base AS test


FROM base AS final
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

