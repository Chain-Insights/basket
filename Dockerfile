# Use official Python image
FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install poetry && \
    poetry install --no-root

# Expose port 8000 for FastAPI
EXPOSE 8000

# Command to run the FastAPI app
CMD ["sh", "-c", "poetry run uvicorn trading_api:app --host 0.0.0.0 --port ${PORT:-8000}"]

