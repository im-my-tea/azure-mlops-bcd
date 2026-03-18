FROM python:3.12-slim

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

#we bind to 0.0.0.0 (External access) and Port 8080 (Standard Web Port for gcp)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]