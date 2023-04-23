FROM python:3.9-slim

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY main.py .

EXPOSE 80
CMD ["uvicorn", "--host=0.0.0.0", "--port=80", "main:app"]
