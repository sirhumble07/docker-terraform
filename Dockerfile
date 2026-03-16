# Use the official python base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies files to the working directory
COPY requirements.txt .

# Install Flask and other dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY src/ .

# Specify the command to run on the container start
CMD ["python", "app.py"]


