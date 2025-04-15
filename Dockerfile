# Etapa base con dependencias
FROM python:3.10-slim AS base

WORKDIR /app

# Instalar dependencias de sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el código fuente
COPY . .

# Etapa de pruebas (para GitHub Actions)
FROM base AS test
CMD ["echo", "Test stage list, replace this with pytest or test scripts"]

# Etapa final para producción (runserver o Gunicorn)
FROM base AS final
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
