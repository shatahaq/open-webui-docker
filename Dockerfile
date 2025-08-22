# Gunakan image python slim agar ringan
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependency sistem dasar
RUN apt-get update && apt-get install -y \
    git curl build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone repo OpenWebUI (hanya core UI, tanpa model lokal)
RUN git clone --depth=1 https://github.com/open-webui/open-webui.git .

# Install package python minimal untuk API
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir fastapi uvicorn openai python-dotenv

# Expose port default
EXPOSE 8080

# Jalankan OpenWebUI
CMD ["python", "main.py", "--host", "0.0.0.0", "--port", "8080"]
