FROM python:3.10-slim

# Install LibreOffice and other needed packages
RUN apt-get update && apt-get install -y \
    libreoffice \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Start app with gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
