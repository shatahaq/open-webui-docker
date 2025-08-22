FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port Railway (default 8080)
EXPOSE 8080

# Jalankan OpenWebUI langsung
CMD ["open-webui", "serve", "--host", "0.0.0.0", "--port", "8080"]
