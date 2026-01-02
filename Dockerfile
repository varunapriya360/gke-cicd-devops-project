FROM python:3.9-slim

WORKDIR /app

# copy requirements FIRST
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy application code
COPY app/ .

EXPOSE 5000
CMD ["python", "app.py"]



