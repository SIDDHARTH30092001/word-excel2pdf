FROM debian:bullseye-slim

# Install Python & LibreOffice
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    libreoffice \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python packages
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Expose port for Render
EXPOSE 5000

# Start the Flask app using Gunicorn
CMD ["python3", "app.py"]
