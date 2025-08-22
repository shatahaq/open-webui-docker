# Gunakan image python yang kecil
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependency sistem yang ringan
RUN apt-get update && apt-get install -y \
    git curl build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone OpenWebUI (tanpa extra model lokal)
RUN git clone --depth=1 https://github.com/open-webui/open-webui.git .

# Install dependencies Python
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8080

# Jalankan OpenWebUI (mode API saja)
CMD ["python", "main.py", "--host", "0.0.0.0", "--port", "8080"]
